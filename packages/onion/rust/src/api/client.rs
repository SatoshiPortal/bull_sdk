//! The service object: one Tor client plus its local SOCKS5 listener.

use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};

use arti_client::config::TorClientConfigBuilder;
use arti_client::{BootstrapBehavior, HasKind as _, IntoTorAddr as _, TorClient};
use futures::Stream;
use futures::StreamExt as _;
use tokio::sync::watch;
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
    client: Mutex<Option<Arc<TorClient<TokioNativeTlsRuntime>>>>,
    proxy_task: Mutex<Option<JoinHandle<TorResult<()>>>>,
    socks_port: u16,
    shutdown: watch::Sender<bool>,
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
        let (shutdown, _) = watch::channel(false);

        Ok(Self {
            client: Mutex::new(Some(client)),
            proxy_task: Mutex::new(Some(proxy_task)),
            socks_port: bound_port,
            shutdown,
        })
    }

    /// The port the SOCKS proxy is actually listening on.
    pub fn socks_port(&self) -> u16 {
        self.socks_port
    }

    /// Current readiness snapshot.
    pub fn status(&self) -> TorStatus {
        self.client()
            .map(|client| TorStatus::from(&client.bootstrap_status()))
            .unwrap_or_else(TorStatus::stopped)
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
        self.client()
            .expect("status stream requested after Tor service stopped")
            .bootstrap_events()
            .map(|s| TorStatus::from(&s))
    }

    /// Start forwarding readiness changes to Dart in a background task.
    ///
    /// Same data as [`TorService::status_stream`], expressed as a
    /// [`StreamSink`] because that is the only stream shape
    /// `flutter_rust_bridge` generates for. The task ends when Dart drops the
    /// subscription, arti closes the channel, or [`TorService::stop`] runs.
    pub fn watch_status(&self, sink: StreamSink<TorStatus>) {
        let Some(client) = self.client() else {
            return;
        };
        let mut events = client.bootstrap_events();
        let mut shutdown = self.shutdown.subscribe();
        tokio::spawn(async move {
            if *shutdown.borrow() {
                return;
            }
            loop {
                tokio::select! {
                    changed = shutdown.changed() => {
                        if changed.is_err() || *shutdown.borrow() {
                            break;
                        }
                    }
                    event = events.next() => {
                        let Some(status) = event else { break };
                        // A send error means Dart cancelled; that is a normal
                        // end, not a failure to report.
                        if sink.add(TorStatus::from(&status)).is_err() {
                            break;
                        }
                    }
                }
            }
        });
    }

    /// Bootstrap, resolving when the client is usable.
    pub async fn bootstrap(&self) -> Result<(), TorFailure> {
        const BOOTSTRAP_TIMEOUT: Duration = Duration::from_secs(120);
        let client = self
            .client()
            .ok_or_else(|| TorFailure::not_running("service stopped before bootstrap"))?;
        let mut shutdown = self.shutdown.subscribe();
        if *shutdown.borrow() {
            return Err(TorFailure::not_running("service stopped before bootstrap"));
        }
        let attempt = tokio::select! {
            changed = shutdown.changed() => {
                let _ = changed;
                return Err(TorFailure::not_running("service stopped during bootstrap"));
            }
            result = tokio::time::timeout(BOOTSTRAP_TIMEOUT, client.bootstrap()) => result,
        };
        match attempt {
            Err(_) => Err(TorFailure::timeout(format!(
                "bootstrap exceeded {BOOTSTRAP_TIMEOUT:?}"
            ))),
            Ok(Err(e)) => {
                // The status snapshot carries `blockage`, which is what tells
                // the user *why* — including `Filtering`, the censorship
                // signature.
                Err(TorFailure::bootstrap(format!("{e}")))
            }
            Ok(Ok(())) => Ok(()),
        }
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
        let client = self
            .client()
            .ok_or_else(|| TorFailure::not_running("service stopped before probe"))?;
        let timeout = Duration::from_millis(u64::from(timeout_ms));
        let target = (host, port)
            .into_tor_addr()
            // `e` would quote the address back; its kind is enough to tell a
            // malformed target from an unroutable one.
            .map_err(|e| TorFailure::connect(format!("bad probe target: {}", e.kind())))?;

        let started = Instant::now();
        let attempt = tokio::time::timeout(timeout, client.connect(target)).await;

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
        !*self.shutdown.borrow()
            && self
                .proxy_task
                .lock()
                .expect("proxy task lock poisoned")
                .as_ref()
                .is_some_and(|task| !task.is_finished())
    }

    /// Put background activity to sleep, or wake it up.
    pub fn set_dormant(&self, dormant: bool) {
        use arti_client::DormantMode;
        if let Some(client) = self.client() {
            client.set_dormant(if dormant {
                DormantMode::Soft
            } else {
                DormantMode::Normal
            });
        }
    }

    /// Stop the proxy listener, bootstrap, and status-forwarding tasks.
    ///
    /// Safe to call more than once. Keeping this as `&self` is required by the
    /// FFI boundary: a status-stream task may briefly hold another opaque
    /// reference, so consuming `self` could panic while decoding the call.
    pub async fn stop(&self) {
        self.shutdown.send_replace(true);
        let proxy_task = self
            .proxy_task
            .lock()
            .expect("proxy task lock poisoned")
            .take();
        if let Some(proxy_task) = proxy_task {
            proxy_task.abort();
            let _ = proxy_task.await;
        }
        self.client.lock().expect("Tor client lock poisoned").take();
    }

    fn client(&self) -> Option<Arc<TorClient<TokioNativeTlsRuntime>>> {
        self.client
            .lock()
            .expect("Tor client lock poisoned")
            .clone()
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

        svc.stop().await;
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

        a.stop().await;
        b.stop().await;
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

        svc.stop().await;
    }

    #[tokio::test]
    async fn stop_cancels_bootstrap_and_is_idempotent() {
        let dir = tempdir();
        let svc = Arc::new(
            TorService::start(&format!("{dir}/s"), &format!("{dir}/c"), 0)
                .await
                .expect("start"),
        );
        let worker = Arc::clone(&svc);
        let bootstrap = tokio::spawn(async move { worker.bootstrap().await });

        tokio::task::yield_now().await;
        svc.stop().await;
        svc.stop().await;

        let result = tokio::time::timeout(Duration::from_secs(1), bootstrap)
            .await
            .expect("bootstrap cancellation must not hang")
            .expect("bootstrap task must not panic");
        let failure = result.expect_err("stopped bootstrap must fail");
        assert_eq!(
            failure.kind,
            super::super::error::TorFailureKind::NotRunning
        );
        assert!(!svc.proxy_is_alive());
    }

    #[tokio::test]
    async fn stop_releases_state_for_an_immediate_restart() {
        let dir = tempdir();
        let state = format!("{dir}/state");
        let cache = format!("{dir}/cache");
        let first = TorService::start(&state, &cache, 0)
            .await
            .expect("start first");

        first.stop().await;

        let second = TorService::start(&state, &cache, 0)
            .await
            .expect("restart with the same state directory");
        second.stop().await;
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
