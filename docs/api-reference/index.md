# API Reference

Bull SDK exposes five modules, each wrapping a Rust library through flutter_rust_bridge.

## Module Overview

| Module | Import | Rust Crate | Purpose |
|--------|--------|-----------|---------|
| **Boltz** | `package:bull_sdk/boltz.dart` | `boltz` | Lightning ↔ onchain atomic swaps via Boltz Exchange |
| **LWK** | `package:bull_sdk/lwk.dart` | `lwk` | Liquid Wallet Kit — addresses, transactions, PayJoin |
| **Ark** | `package:bull_sdk/ark.dart` | `ark_wallet` | Ark protocol — offchain payments and settlements |
| **BBQr** | `package:bull_sdk/bbqr.dart` | `bbqr` + `dart_bbqr` | Animated QR code encoding/decoding |
| **Bitbox** | `package:bull_sdk/bitbox.dart` | `bitbox` | Bitbox hardware wallet integration |

## Initialization

All modules share a single native library. Initialize once:

```dart
import 'package:bull_sdk/bull_sdk.dart';

await BullSdk.init();
```

After initialization, import individual modules as needed:

```dart
import 'package:bull_sdk/boltz.dart' as boltz;
import 'package:bull_sdk/lwk.dart' as lwk;
import 'package:bull_sdk/ark.dart' as ark;
import 'package:bull_sdk/bbqr.dart' as bbqr;
import 'package:bull_sdk/bitbox.dart' as bitbox;
```

## Common Patterns

### Error Handling

All async operations return `Future<T>` and throw on error. Wrap in try-catch:

```dart
try {
  final swap = await boltz.BtcLnSwap.newSubmarine(...);
} catch (e) {
  print('Swap creation failed: $e');
}
```

### Network Selection

Most modules accept a network parameter:

```dart
// Bitcoin mainnet
boltz.Chain.bitcoin

// Liquid mainnet/testnet
lwk.LiquidNetwork.mainnet
lwk.LiquidNetwork.testnet
```

!!! info "Detailed API"
    Each module page contains the full class/method reference generated from Rust source code.
