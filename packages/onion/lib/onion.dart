/// Embedded Tor client and loopback SOCKS5 proxy, built on Arti.
///
/// **This is not an official Tor Project product.** Tor is a trademark of The
/// Tor Project; all rights reserved — <https://torproject.org>. This package
/// is not endorsed or sponsored by, or affiliated with, the Tor Project.
///
/// ```dart
/// await OnionCore.init();
/// final tor = await TorService.start(
///   stateDir: '$appSupport/tor_state',
///   cacheDir: '$appSupport/tor_cache',
///   socksPort: 0, // 0 lets the OS pick; read it back from socksPort()
///   // Relays anything Tor can reach. An app that only talks to hidden
///   // services can narrow this to `SocksPolicy.onionOnly` — see its doc for
///   // what that does and does not protect against.
///   policy: SocksPolicy.any,
/// );
///
/// tor.watchStatus().listen((s) {
///   // Not monotonic: arti reports a *lower* readiness when connectivity
///   // drops or its directory expires. Treat every event as current truth.
///   if (s.blockage?.kind == BlockageKind.filtering) {
///     // TCP works, the Tor handshake does not: the censorship signature.
///   }
/// });
///
/// await tor.bootstrap();
/// final port = await tor.socksPort();
/// ```
library;

export 'src/rust/api/client.dart';
export 'src/rust/api/error.dart';
// `TorSession` and the `SocksPolicy` every `start`/`openSession` call must
// name.
export 'src/rust/api/session.dart';
export 'src/rust/api/status.dart';
export 'src/rust/frb_generated.dart' show OnionCore;
export 'src/snowflake_transport.dart';
