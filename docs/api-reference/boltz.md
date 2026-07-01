# Boltz — Atomic Swaps

Lightning ↔ onchain atomic swaps via [Boltz Exchange](https://boltz.exchange).

**Import:** `package:bull_sdk/boltz.dart`

---

## BtcLnSwap

Bitcoin ↔ Lightning swaps.

### Creating Swaps

#### Submarine Swap (onchain → lightning)

Pay a Lightning invoice using onchain Bitcoin.

```dart
final swap = await boltz.BtcLnSwap.newSubmarine(
  swapMasterKey: masterKey,
  index: BigInt.zero,
  invoice: invoice,
  network: boltz.Chain.bitcoin,
  electrumUrl: 'electrum.blockstream.info:50002',
  boltzUrl: 'https://boltz.exchange',
);
```

#### Reverse Swap (lightning → onchain)

Receive onchain Bitcoin via Lightning.

```dart
final swap = await boltz.BtcLnSwap.newReverse(
  swapMasterKey: masterKey,
  index: BigInt.one,
  outAmount: BigInt.from(100000),
  outAddress: 'bc1q...',
  network: boltz.Chain.bitcoin,
  electrumUrl: 'electrum.blockstream.info:50002',
  boltzUrl: 'https://boltz.exchange',
);
```

### Managing Swaps

```dart
// Broadcast a signed transaction
final txid = await swap.broadcastBoltz(signedHex: signedHex);

// Claim a reverse swap
final claimTxid = await swap.claim(
  outAddress: 'bc1q...',
  minerFee: boltz.TxFee.absolute(BigInt.from(5000)),
  tryCooperate: true,
);

// Refund a failed submarine swap
final refundTxid = await swap.refund(
  outAddress: 'bc1q...',
  minerFee: boltz.TxFee.absolute(BigInt.from(5000)),
  tryCooperate: true,
);

// Cooperative close (reduces onchain footprint)
await swap.coopCloseSubmarine();
```

### Serialization

```dart
// Save swap state
final json = await swap.toJson();

// Restore from saved state
final restored = await boltz.BtcLnSwap.fromJson(jsonStr: json);
```

---

## LBtcLnSwap

Liquid L-BTC ↔ Lightning swaps. Same API as `BtcLnSwap` but for the Liquid network.

---

## ChainSwap

Cross-chain swaps between different blockchains.

---

## Supporting Types

| Type | Description |
|------|-------------|
| `SwapType` | `submarine` or `reverse` |
| `Chain` | `bitcoin`, `liquid` |
| `KeyPair` | Cryptographic key pair for the swap |
| `PreImage` | Preimage for HTLC |
| `TxFee` | `TxFee.absolute(sats)` or `TxFee.relative(feeRate)` |
| `ElectrumSettings` | Custom electrum server configuration |
| `BtcSwapScriptStr` | Swap script details |

---

## Fees

```dart
// Get swap fees from Boltz
final fees = await boltz.getFees(boltzUrl: 'https://boltz.exchange');
```

---

## Swap Status

```dart
// Check swap status
final status = await boltz.swapStatus(
  id: swap.id,
  boltzUrl: 'https://boltz.exchange',
);
```

---

## Gotchas

- **Key management**: The `swapMasterKey` should be persisted. The `index` must be incremented for each new swap to avoid key reuse.
- **Cooperative close**: Call `coopCloseSubmarine()` within ~1 hour after submarine swap completion, otherwise the swap closes via script path (larger onchain footprint).
- **Electrum servers**: Use reliable electrum servers. The default URLs are examples — production should use your own or trusted public servers.
