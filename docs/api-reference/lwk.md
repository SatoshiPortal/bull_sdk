# LWK — Liquid Wallet Kit

Liquid network wallet operations: addresses, transactions, balances, and PayJoin.

**Import:** `package:bull_sdk/lwk.dart`

---

## Wallet

Core class for Liquid wallet management.

### Initialization

```dart
final wallet = await lwk.Wallet.init(
  network: lwk.LiquidNetwork.mainnet,
  dbpath: '/path/to/wallet.db',
  descriptor: descriptor,
);
```

### Addresses

```dart
// Get address at specific index
final addr = await wallet.address(index: 0);

// Get last unused address
final addr = await wallet.addressLastUnused();
```

### Syncing

```dart
await wallet.sync_(
  electrumUrl: 'blockstream.info:995',
  validateDomain: false,
  stopAtIndex: null,    // null = sync all
  timeout: null,        // no timeout
);
```

### Balances

```dart
final balances = await wallet.balances();
// Returns List<Balance> — one per asset
```

### Building Transactions

#### L-BTC Transaction

```dart
final pset = await wallet.buildLbtcTx(
  sats: BigInt.from(100000),
  outAddress: 'lq1qq...',
  feeRate: 1.0,
  drain: false,  // true = send all (drain wallet)
);
```

#### Asset Transaction

```dart
final pset = await wallet.buildAssetTx(
  sats: BigInt.from(5000),
  outAddress: 'lq1qq...',
  feeRate: 1.0,
  asset: 'asset-id-here',
);
```

#### PayJoin Transaction

```dart
final payjoinTx = await wallet.buildPayjoinTx(
  sats: BigInt.from(5000),
  outAddress: 'lq1qq...',
  asset: 'asset-id',
  network: lwk.LiquidNetwork.mainnet,
  isSendAll: false,
);

// Review server fee before signing
print('Server fee: ${payjoinTx.serverFee}');
```

### Signing

```dart
final signedPset = await wallet.signTx(
  network: lwk.LiquidNetwork.mainnet,
  pset: pset,
  mnemonic: mnemonic,
);
```

### Transaction History

```dart
final txs = await wallet.txs();
// Returns List<Tx>
```

### UTXOs

```dart
final utxos = await wallet.utxos();
// Returns List<TxOut>
```

---

## Descriptor

Wallet descriptor for address generation.

```dart
final descriptor = await lwk.Descriptor.fromString(
  desc: 'descriptor-string',
);
```

---

## Supporting Types

| Type | Description |
|------|-------------|
| `LiquidNetwork` | `mainnet` or `testnet` |
| `Address` | Liquid address with index |
| `Balance` | Asset balance (asset ID + amount) |
| `Tx` | Transaction details |
| `TxOut` | Transaction output (UTXO) |
| `PayjoinTx` | PayJoin transaction result with server fee |

---

## Gotchas

- **Database path**: The `dbpath` must be writable. On mobile, use the app's documents directory.
- **Sync before operations**: Always call `sync_()` before building transactions or checking balances.
- **PayJoin fee review**: Always review the `serverFee` in `PayjoinTx` before signing and broadcasting.
- **Asset IDs**: Liquid assets are identified by hex strings. Use the correct asset ID for asset transactions.
