# Bull SDK

**Binding unificati di flutter_rust_bridge per operazioni di wallet Bitcoin e Liquid.**

Bull SDK unisce cinque biblioteche Rust indipendenti — [Ark](https://github.com/SatoshiPortal/ark-wallet-dart), [BBQr](https://github.com/SatoshiPortal/bbqr-dart), [Boltz](https://github.com/SatoshiPortal/boltz-dart), [LWK](https://github.com/SatoshiPortal/lwk-dart) e [Bitbox](https://github.com/SatoshiPortal/bitbox-dart) — in una singola libreria nativa con binding Dart unificati.

---

## Perché Bull SDK?

Ogni pacchetto indipendente compila la propria libreria nativa (`.so`/`.dylib`). Quando un progetto dipende da tutti, si ottiene:

- **Build lente** — 5 compilazioni native separate, specialmente dolorose su Android (3 architetture ciascuna)
- **Binari gonfiati** — Dipendenze Rust condivise (bitcoin, secp256k1, tokio, openssl) duplicate in ogni libreria

Bull SDK risolve questo scansionando le API Rust di tutti i sub-crate attraverso una singola passata di codegen `flutter_rust_bridge`, producendo **una libreria nativa** con **un singolo dispatcher FFI**.

---

## Moduli

| Modulo | Funzione | Classi principali |
|--------|----------|-------------------|
| [**Boltz**](api-reference/boltz.md) | Swap atomici Lightning ↔ onchain | `BtcLnSwap`, `LBtcLnSwap`, `ChainSwap` |
| [**LWK**](api-reference/lwk.md) | Liquid Wallet Kit — operazioni rete Liquid | `Wallet`, `Descriptor`, `Tx` |
| [**Ark**](api-reference/ark.md) | Protocollo Ark — pagamenti offchain | `ArkWallet`, `ArkTransaction` |
| [**BBQr**](api-reference/bbqr.md) | Codifica/decodifica QR animati | `Encoding`, `Split`, `Join` |
| [**Bitbox**](api-reference/bitbox.md) | Integrazione wallet hardware | `BitboxApi` |

---

## Quick Start

```dart
import 'package:bull_sdk/bull_sdk.dart';
import 'package:bull_sdk/boltz.dart' as boltz;
import 'package:bull_sdk/lwk.dart' as lwk;

await BullSdk.init();
```

---

## Piattaforme Supportate

| Piattaforma | Stato |
|-------------|-------|
| Android | ✅ Supportato |
| iOS | ✅ Supportato |
| Linux | ✅ Supportato |
| macOS | ✅ Supportato |
| Windows | ✅ Supportato |
| Web | ⚠️ Solo Dart (API Rust non disponibili) |

---

## Link

- [GitHub](https://github.com/SatoshiPortal/bull_sdk)
- [Bull Bitcoin](https://www.bullbitcoin.com)
- [Installazione](getting-started/installation.md)
