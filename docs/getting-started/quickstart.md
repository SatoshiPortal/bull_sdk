# Quick Start

## Initialize the SDK

```dart
import 'package:bull_sdk/bull_sdk.dart';
import 'package:bull_sdk/boltz.dart' as boltz;
import 'package:bull_sdk/lwk.dart' as lwk;
import 'package:bull_sdk/bbqr.dart' as bbqr;
import 'package:bull_sdk/ark.dart' as ark;

void main() async {
  await BullSdk.init();
}
```

## Example: Create a Lightning Swap

```dart
import 'package:bull_sdk/boltz.dart' as boltz;

// Create a submarine swap (onchain → lightning)
final swap = await boltz.BtcLnSwap.newSubmarine(
  swapMasterKey: masterKey,
  index: BigInt.zero,
  invoice: invoice,
  network: boltz.Chain.bitcoin,
  electrumUrl: 'electrum.blockstream.info:50002',
  boltzUrl: 'https://boltz.exchange',
);

// Get the funding address
final address = swap.scriptAddress;

// After funding, claim the swap
final txid = await swap.claim(
  outAddress: 'bc1q...',
  minerFee: boltz.TxFee.absolute(BigInt.from(5000)),
  tryCooperate: true,
);
```

## Example: Liquid Wallet Operations

```dart
import 'package:bull_sdk/lwk.dart' as lwk;

// Initialize a Liquid wallet
final wallet = await lwk.Wallet.init(
  network: lwk.LiquidNetwork.mainnet,
  dbpath: '/path/to/wallet.db',
  descriptor: descriptor,
);

// Sync with electrum server
await wallet.sync_(
  electrumUrl: 'blockstream.info:995',
  validateDomain: false,
);

// Get balances
final balances = await wallet.balances();

// Build a transaction
final pset = await wallet.buildLbtcTx(
  sats: BigInt.from(100000),
  outAddress: 'lq1qq...',
  feeRate: 1.0,
  drain: false,
);
```

## Example: QR Code Encoding

```dart
import 'package:bull_sdk/bbqr.dart' as bbqr;

// Encode data for animated QR transmission
final parts = await bbqr.split(
  data: yourData,
  encoding: bbqr.Encoding.zlib,
  fileType: bbqr.FileType.psbt,
);
```

## Build for Development

```bash
# Web (fastest — Dart only, no Rust)
cd packages/bull_sdk
flutter build web

# Linux Desktop (full Rust access)
flutter run -d linux
```

!!! info "Next Step"
    See the [Architecture](../architecture.md) page to understand how the unified library works.
