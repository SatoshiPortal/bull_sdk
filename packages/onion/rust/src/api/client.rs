//! The service object: one Tor client plus its local SOCKS5 listener.

use std::sync::Arc;
use std::time::{Duration, Instant};

use arti_client::config::TorClientConfigBuilder;
use arti_client::{BootstrapBehavior, HasKind as _, IntoTorAddr as _, TorClient};
use futures::Stream;
use futures::StreamExt as _;
use tokio::task::JoinHandle;
use tor_rtcompat::tokio::TokioNativeTlsRuntime;
use tracing::info;

use super::error::{TorFailure, TorResult};
use super::socks;
use super::status::TorStatus;
use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;

/// A running Tor client with a loopback SOCKS5 proxy in front of it.
///
/// Construction is deliberately split from bootstrap: [`TorService::start`]
/// returns as soon as the listener is bound, so the caller learns the port and
/// can subscribe to [`TorService::status_stream`] *before* the slow part
/// begins. The old design blocked inside `create_bootstrapped()` with no
/// progress channel, which is why a censored network presented as an
/// indefinite spinner followed by an unattributable Electrum error.
pub struct TorService {
    client: Arc<TorClient<TokioNativeTlsRuntime>>,
    proxy_task: JoinHandle<TorResult<()>>,
    socks_port: u16,
}

impl TorService {
    /// Create the client and bind the SOCKS listener. Does not bootstrap.
    ///
    /// `socks_port` may be `0` to let the OS choose; read the real value back
    /// from [`TorService::socks_port`].
    pub async fn start(
        state_dir: &str,
        cache_dir: &str,
        socks_port: u16,
    ) -> Result<Self, TorFailure> {
        let runtime = TokioNativeTlsRuntime::current()
            .map_err(|e| TorFailure::configuration(format!("no tokio runtime: {e}")))?;

        // Besides state and cache, this derives Arti's keystore location from
        // the state directory. Setting storage fields manually leaves the
        // keystore at its unrelated default path.
        let mut cfg = TorClientConfigBuilder::from_directories(state_dir, cache_dir);
        // Required for .onion targets to be routable through the proxy.
        cfg.address_filter().allow_onion_addrs(true);
        let cfg = cfg
            .build()
            .map_err(|e| TorFailure::configuration(format!("config: {e}")))?;

        let client = TorClient::with_runtime(runtime)
            .config(cfg)
            // `Manual` keeps bootstrap under our control so progress is
            // observable. With `OnDemand` the first proxied request would
            // silently trigger it and we would lose the reporting window.
            .bootstrap_behavior(BootstrapBehavior::Manual)
            .create_unbootstrapped()
            .map_err(|e| TorFailure::configuration(format!("create client: {e}")))?;

        let (listener, addr) = socks::bind_loopback(socks_port).await?;
        let bound_port = addr.port();
        info!(port = bound_port, "socks listener bound");

        let proxy_task = tokio::spawn(socks::serve(listener, Arc::clone(&client)));

        Ok(Self {
            client,
            proxy_task,
            socks_port: bound_port,
        })
    }

    /// The port the SOCKS proxy is actually listening on.
    pub fn socks_port(&self) -> u16 {
        self.socks_port
    }

    /// Current readiness snapshot.
    pub fn status(&self) -> TorStatus {
        TorStatus::from(&self.client.bootstrap_status())
    }

    /// A stream of readiness changes, for Rust callers and tests.
    ///
    /// Not monotonic: arti emits a *lower* readiness when connectivity drops or
    /// the directory expires. Consumers must treat every item as the current
    /// truth rather than latching the first `ready_for_traffic`.
    ///
    /// Hidden from the binding: `flutter_rust_bridge` has no mapping for
    /// `impl Stream`, it wants a [`StreamSink`]. [`TorService::watch_status`]
    /// is the same data in the shape the generator understands.
    #[frb(ignore)]
    pub fn status_stream(&self) -> impl Stream<Item = TorStatus> + Send + 'static {
        self.client.bootstrap_events().map(|s| TorStatus::from(&s))
    }

    /// Push readiness changes to Dart until the subscription is cancelled.
    ///
    /// Same data as [`TorService::status_stream`], expressed as a
    /// [`StreamSink`] because that is the only stream shape
    /// `flutter_rust_bridge` generates for. Returns when the Dart side drops
    /// the subscription or arti closes the channel.
    pub async fn watch_status(&self, sink: StreamSink<TorStatus>) -> Result<(), TorFailure> {
        let mut events = self.client.bootstrap_events();
        while let Some(s) = events.next().await {
            // An error here means Dart cancelled; that is a normal end, not a
            // failure to report.
            if sink.add(TorStatus::from(&s)).is_err() {
                break;
            }
        }
        Ok(())
    }

    /// Bootstrap, resolving when the client is usable.
    pub async fn bootstrap(&self) -> Result<(), TorFailure> {
        self.client.bootstrap().await.map_err(|e| {
            // The status snapshot carries `blockage`, which is what tells the
            // user *why* — including `Filtering`, the censorship signature.
            TorFailure::bootstrap(format!("{e}"))
        })
    }

    /// Open and immediately close a circuit to `host:port`, returning how long
    /// it took.
    ///
    /// This is the canary that separates "the Tor network is unreachable" from
    /// "our Electrum server is down". It goes through `TorClient::connect`
    /// directly, bypassing both the SOCKS listener and the application's
    /// servers, so a success here means Tor genuinely carries traffic.
    ///
    /// `ready_for_traffic` is not a substitute: it means "a request can be
    /// started", not "a request succeeded".
    ///
    /// Times are milliseconds: FRB has no outbound mapping for
    /// `std::time::Duration`, and an integer keeps `chrono` out of our types.
    ///
    /// No failure returned here names `host`. The probe target is a hidden
    /// service the user is reaching over Tor, and these strings are logged;
    /// `socks::handle_conn` keeps destinations out of its errors for the same
    /// reason, so this must not be the one place that reintroduces them.
    pub async fn probe(&self, host: &str, port: u16, timeout_ms: u32) -> Result<u32, TorFailure> {
        let timeout = Duration::from_millis(u64::from(timeout_ms));
        let target = (host, port)
            .into_tor_addr()
            // `e` would quote the address back; its kind is enough to tell a
            // malformed target from an unroutable one.
            .map_err(|e| TorFailure::connect(format!("bad probe target: {}", e.kind())))?;

        let started = Instant::now();
        let attempt = tokio::time::timeout(timeout, self.client.connect(target)).await;

        match attempt {
            Err(_elapsed) => Err(TorFailure::timeout(format!("probe exceeded {timeout:?}"))),
            // arti's `Display` embeds the destination; its kind does not.
            Ok(Err(e)) => Err(TorFailure::connect(format!("probe failed: {}", e.kind()))),
            Ok(Ok(stream)) => {
                drop(stream);
                Ok(started.elapsed().as_millis().min(u128::from(u32::MAX)) as u32)
            }
        }
    }

    /// Whether the SOCKS accept loop is still running.
    ///
    /// It can die on its own — a listener error ends it — after which every
    /// connection to [`TorService::socks_port`] is refused. Without this, the
    /// app would see unexplained connection failures from BDK and blame the
    /// network. Cheap enough to check before handing the port out.
    pub fn proxy_is_alive(&self) -> bool {
        !self.proxy_task.is_finished()
    }

    /// Put background activity to sleep, or wake it up.
    pub fn set_dormant(&self, dormant: bool) {
        use arti_client::DormantMode;
        self.client.set_dormant(if dormant {
            DormantMode::Soft
        } else {
            DormantMode::Normal
        });
    }

    /// Stop the proxy listener and drop the client.
    ///
    /// Takes `self` by value: a stopped service is not reusable, and the type
    /// system should say so rather than leaving a zombie handle around — which
    /// is how the previous wrapper ended up with a dangling client pointer.
    pub fn stop(self) {
        self.proxy_task.abort();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Everything up to (not including) bootstrap must work with no network:
    /// the port is known and the status is a well-formed "not ready".
    #[tokio::test]
    async fn start_binds_without_network_and_reports_a_port() {
        let dir = tempdir();
        let svc = TorService::start(&format!("{dir}/state"), &format!("{dir}/cache"), 0)
            .await
            .expect("start must not require the network");

        assert_ne!(svc.socks_port(), 0);
        assert!(
            svc.proxy_is_alive(),
            "accept loop must be running after start"
        );

        let st = svc.status();
        assert!(!st.ready_for_traffic, "cannot be ready before bootstrap");
        assert!(!st.suggests_censorship(), "no blockage diagnosed yet");

        svc.stop();
    }

    #[tokio::test]
    async fn two_services_get_distinct_ports() {
        let d1 = tempdir();
        let d2 = tempdir();
        let a = TorService::start(&format!("{d1}/s"), &format!("{d1}/c"), 0)
            .await
            .expect("start a");
        let b = TorService::start(&format!("{d2}/s"), &format!("{d2}/c"), 0)
            .await
            .expect("start b");

        assert_ne!(a.socks_port(), b.socks_port());

        a.stop();
        b.stop();
    }

    #[tokio::test]
    async fn probe_before_bootstrap_times_out_rather_than_hanging() {
        let dir = tempdir();
        let svc = TorService::start(&format!("{dir}/s"), &format!("{dir}/c"), 0)
            .await
            .expect("start");

        let err = svc
            .probe("example.com", 80, 300)
            .await
            .expect_err("must not succeed without bootstrap");

        // Either shape is acceptable; what matters is that it returns.
        assert!(matches!(
            err.kind,
            super::super::error::TorFailureKind::Timeout
                | super::super::error::TorFailureKind::Connect
        ));

        svc.stop();
    }

    /// Unique scratch directory per test, cleaned up by the OS.
    fn tempdir() -> String {
        use std::sync::atomic::{AtomicU32, Ordering};
        static N: AtomicU32 = AtomicU32::new(0);
        let n = N.fetch_add(1, Ordering::Relaxed);
        let p = std::env::temp_dir().join(format!("onion_test_{}_{}", std::process::id(), n));
        std::fs::create_dir_all(&p).expect("mkdir");
        p.to_string_lossy().into_owned()
    }
}
