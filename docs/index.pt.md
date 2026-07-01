# Bull SDK

**Bindings unificados de flutter_rust_bridge para operações de carteiras Bitcoin e Liquid.**

Bull SDK une cinco bibliotecas Rust independentes — [Ark](https://github.com/SatoshiPortal/ark-wallet-dart), [BBQr](https://github.com/SatoshiPortal/bbqr-dart), [Boltz](https://github.com/SatoshiPortal/boltz-dart), [LWK](https://github.com/SatoshiPortal/lwk-dart) e [Bitbox](https://github.com/SatoshiPortal/bitbox-dart) — em uma única biblioteca nativa com bindings Dart unificados.

---

## Por que Bull SDK?

Cada pacote independente compila sua própria biblioteca nativa (`.so`/`.dylib`). Quando um projeto depende de todos, você obtém:

- **Builds lentos** — 5 compilações nativas separadas, especialmente dolorosas no Android (3 arquiteturas cada uma)
- **Binários inchados** — Dependências Rust compartilhadas (bitcoin, secp25k1, tokio, openssl) duplicadas em cada biblioteca

Bull SDK resolve isso escaneando as APIs Rust de todos os sub-crates através de uma única passada de codegen `flutter_rust_bridge`, produzindo **uma biblioteca nativa** com **um único despachante FFI**.

---

## Módulos

| Módulo | Função | Classes principais |
|--------|--------|-------------------|
| [**Boltz**](api-reference/boltz.md) | Swaps atômicos Lightning ↔ onchain | `BtcLnSwap`, `LBtcLnSwap`, `ChainSwap` |
| [**LWK**](api-reference/lwk.md) | Liquid Wallet Kit — operações rede Liquid | `Wallet`, `Descriptor`, `Tx` |
| [**Ark**](api-reference/ark.md) | Protocolo Ark — pagamentos offchain | `ArkWallet`, `ArkTransaction` |
| [**BBQr**](api-reference/bbqr.md) | Codificação/decodificação de QR animado | `Encoding`, `Split`, `Join` |
| [**Bitbox**](api-reference/bitbox.md) | Integração com carteira de hardware | `BitboxApi` |

---

## Início Rápido

```dart
import 'package:bull_sdk/bull_sdk.dart';
import 'package:bull_sdk/boltz.dart' as boltz;
import 'package:bull_sdk/lwk.dart' as lwk;

await BullSdk.init();
```

---

## Plataformas Suportadas

| Plataforma | Status |
|------------|--------|
| Android | ✅ Suportado |
| iOS | ✅ Suportado |
| Linux | ✅ Suportado |
| macOS | ✅ Suportado |
| Windows | ✅ Suportado |
| Web | ⚠️ Apenas Dart (APIs Rust indisponíveis) |

---

## Links

- [GitHub](https://github.com/SatoshiPortal/bull_sdk)
- [Bull Bitcoin](https://www.bullbitcoin.com)
- [Instalação](getting-started/installation.md)
