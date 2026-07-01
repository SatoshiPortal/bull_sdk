# Bull SDK

**Unified flutter_rust_bridge bindings for Bitcoin and Liquid wallet operations.**

Bull SDK merges five standalone Rust libraries — [Ark](https://github.com/SatoshiPortal/ark-wallet-dart), [BBQr](https://github.com/SatoshiPortal/bbqr-dart), [Boltz](https://github.com/SatoshiPortal/boltz-dart), [LWK](https://github.com/SatoshiPortal/lwk-dart), and [Bitbox](https://github.com/SatoshiPortal/bitbox-dart) — into a single native library with unified Dart bindings.

---

## Why Bull SDK?

Each standalone package compiles its own native library (`.so`/`.dylib`). When a project depends on all of them, you get:

- **Slow builds** — 5 separate native compilations, especially painful on Android (3 architectures each)
- **Bloated binaries** — Shared Rust dependencies (bitcoin, secp256k1, tokio, openssl) duplicated across each library

Bull SDK solves this by scanning all sub-crate Rust APIs through a single `flutter_rust_bridge` codegen pass, producing **one native library** with **one FFI dispatcher**.

---

## Modules

| Module | What it does | Key classes |
|--------|-------------|-------------|
| [**Boltz**](api-reference/boltz.md) | Lightning ↔ onchain atomic swaps | `BtcLnSwap`, `LBtcLnSwap`, `ChainSwap` |
| [**LWK**](api-reference/lwk.md) | Liquid Wallet Kit — Liquid network ops | `Wallet`, `Descriptor`, `Tx` |
| [**Ark**](api-reference/ark.md) | Ark protocol — offchain payments | `ArkWallet`, `ArkTransaction` |
| [**BBQr**](api-reference/bbqr.md) | Animated QR encoding/decoding | `Encoding`, `Split`, `Join` |
| [**Bitbox**](api-reference/bitbox.md) | Hardware wallet integration | `BitboxApi` |

---

## Quick Start

```dart
import 'package:bull_sdk/bull_sdk.dart';
import 'package:bull_sdk/boltz.dart' as boltz;
import 'package:bull_sdk/lwk.dart' as lwk;

await BullSdk.init();
```

---

## Supported Platforms

| Platform | Status |
|----------|--------|
| Android | ✅ Supported |
| iOS | ✅ Supported |
| Linux | ✅ Supported |
| macOS | ✅ Supported |
| Windows | ✅ Supported |
| Web | ⚠️ Dart-only (Rust APIs unavailable) |

---

## Links

- [GitHub](https://github.com/SatoshiPortal/bull_sdk)
- [Bull Bitcoin](https://www.bullbitcoin.com)
- [Getting Started](getting-started/installation.md)
