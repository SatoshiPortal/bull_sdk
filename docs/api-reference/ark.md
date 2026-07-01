# Ark — Ark Protocol

Ark protocol wallet: offchain payments, boarding, and settlements.

**Import:** `package:bull_sdk/ark.dart`

---

## ArkWallet

Core class for Ark protocol operations.

### Initialization

```dart
final wallet = await ark.ArkWallet.init(
  secretKey: secretKey,      // List<int> (32 bytes)
  network: 'mainnet',        // or 'testnet'
  esplora: 'https://esplora.blockstream.info',
  server: 'https://arkserver.example.com',
  boltz: 'https://boltz.exchange',
);
```

### Addresses

```dart
// Offchain Ark address
final offchainAddr = wallet.offchainAddress();

// Onchain boarding address
final onchainAddr = wallet.onchainAddress();

// Boarding address (same as onchain, for boarding UTXOs)
final boardingAddr = wallet.boardingAddress();
```

### Sending

```dart
// Send offchain (Ark-to-Ark, instant)
final txid = await wallet.sendOffChain(
  address: 'ark1q...',
  sats: BigInt.from(100000),
);

// Send onchain (standard Bitcoin/Liquid transaction)
final txid = await wallet.sendOnChain(
  address: 'bc1q...',
  sats: BigInt.from(100000),
);
```

### Settlements

```dart
// Settle pending offchain transactions
await wallet.settle(selectRecoverableVtxos: true);

// Settle boarding transactions (onchain → offchain)
final status = await wallet.settleBoardingTransactions(
  selectRecoverableVtxos: true,
);

// Check boarding status
final boardingStatus = await wallet.getBoardingStatus();
final canSettle = await wallet.canSettleBoarding();
```

### Balance and History

```dart
final balance = await wallet.balance();
// Returns ArkBalance

final history = await wallet.transactionHistory();
// Returns List<ArkTransaction>
```

---

## ArkTransaction

Union type representing different transaction states:

```dart
enum ArkTransaction {
  Boarding {
    String txid;
    int sats;
    int? confirmedAt;
  },
  Commitment {
    String txid;
    int sats;
    int createdAt;
  },
  Redeem {
    String txid;
    int sats;
    bool isSettled;
    int createdAt;
  },
}
```

| Variant | Meaning |
|---------|---------|
| `Boarding` | Onchain UTXO awaiting settlement to offchain |
| `Commitment` | Offchain commitment created |
| `Redeem` | Offchain redemption (settled or pending) |

---

## Server Info

```dart
final info = wallet.serverInfo();
// Returns ServerInfo with server details
```

---

## Gotchas

- **Secret key**: Must be exactly 32 bytes. Store securely — it controls the wallet.
- **Boarding delay**: Boarding transactions require confirmation before they can be settled. Check `canSettleBoarding()` before attempting settlement.
- **Recoverable VTXOs**: When `selectRecoverableVtxos: true`, the wallet selects UTXOs that can be recovered if the server goes offline.
- **Network strings**: Ark uses string network identifiers (`'mainnet'`/`'testnet'`), not enum values like LWK.
