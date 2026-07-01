# Bull SDK

**Bindings unificados de flutter_rust_bridge para operaciones de billeteras Bitcoin y Liquid.**

Bull SDK fusiona cinco bibliotecas Rust independientes — [Ark](https://github.com/SatoshiPortal/ark-wallet-dart), [BBQr](https://github.com/SatoshiPortal/bbqr-dart), [Boltz](https://github.com/SatoshiPortal/boltz-dart), [LWK](https://github.com/SatoshiPortal/lwk-dart) y [Bitbox](https://github.com/SatoshiPortal/bitbox-dart) — en una única biblioteca nativa con bindings Dart unificados.

---

## ¿Por qué Bull SDK?

Cada paquete independiente compila su propia biblioteca nativa (`.so`/`.dylib`). Cuando un proyecto depende de todos, obtienes:

- **Compilaciones lentas** — 5 compilaciones nativas separadas, especialmente dolorosas en Android (3 arquitecturas cada una)
- **Binarios inflados** — Dependencias Rust compartidas (bitcoin, secp256k1, tokio, openssl) duplicadas en cada biblioteca

Bull SDK resuelve esto escaneando las APIs Rust de todos los sub-crates a través de una única pasada de código de `flutter_rust_bridge`, produciendo **una biblioteca nativa** con **un despachador FFI**.

---

## Módulos

| Módulo | Función | Clases principales |
|--------|---------|-------------------|
| [**Boltz**](api-reference/boltz.md) | Swaps atómicos Lightning ↔ onchain | `BtcLnSwap`, `LBtcLnSwap`, `ChainSwap` |
| [**LWK**](api-reference/lwk.md) | Liquid Wallet Kit — operaciones en red Liquid | `Wallet`, `Descriptor`, `Tx` |
| [**Ark**](api-reference/ark.md) | Protocolo Ark — pagos offchain | `ArkWallet`, `ArkTransaction` |
| [**BBQr**](api-reference/bbqr.md) | Codificación/decodificación de QR animado | `Encoding`, `Split`, `Join` |
| [**Bitbox**](api-reference/bitbox.md) | Integración con billetera de hardware | `BitboxApi` |

---

## Inicio Rápido

```dart
import 'package:bull_sdk/bull_sdk.dart';
import 'package:bull_sdk/boltz.dart' as boltz;
import 'package:bull_sdk/lwk.dart' as lwk;

await BullSdk.init();
```

---

## Plataformas Soportadas

| Plataforma | Estado |
|------------|--------|
| Android | ✅ Soportado |
| iOS | ✅ Soportado |
| Linux | ✅ Soportado |
| macOS | ✅ Soportado |
| Windows | ✅ Soportado |
| Web | ⚠️ Solo Dart (APIs Rust no disponibles) |

---

## Enlaces

- [GitHub](https://github.com/SatoshiPortal/bull_sdk)
- [Bull Bitcoin](https://www.bullbitcoin.com)
- [Instalación](getting-started/installation.md)
