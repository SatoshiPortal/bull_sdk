# Quick Start

## Inizializzare il SDK

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

## Esempio: Creare uno Swap Lightning

```dart
import 'package:bull_sdk/boltz.dart' as boltz;

// Creare uno swap submarine (onchain → lightning)
final swap = await boltz.BtcLnSwap.newSubmarine(
  swapMasterKey: masterKey,
  index: BigInt.zero,
  invoice: invoice,
  network: boltz.Chain.bitcoin,
  electrumUrl: 'electrum.blockstream.info:50002',
  boltzUrl: 'https://boltz.exchange',
);

// Ottenere l'indirizzo di funding
final address = swap.scriptAddress;

// Dopo il funding, reclamare lo swap
final txid = await swap.claim(
  outAddress: 'bc1q...',
  minerFee: boltz.TxFee.absolute(BigInt.from(5000)),
  tryCooperate: true,
);
```

## Esempio: Operazioni Wallet Liquid

```dart
import 'package:bull_sdk/lwk.dart' as lwk;

// Inizializzare un wallet Liquid
final wallet = await lwk.Wallet.init(
  network: lwk.LiquidNetwork.mainnet,
  dbpath: '/percorso/a/wallet.db',
  descriptor: descriptor,
);

// Sincronizzare con il server electrum
await wallet.sync_(
  electrumUrl: 'blockstream.info:995',
  validateDomain: false,
);

// Ottenere i saldi
final balances = await wallet.balances();

// Costruire una transazione
final pset = await wallet.buildLbtcTx(
  sats: BigInt.from(100000),
  outAddress: 'lq1qq...',
  feeRate: 1.0,
  drain: false,
);
```

## Compilare per lo Sviluppo

```bash
# Web (più veloce — solo Dart, senza Rust)
cd packages/bull_sdk
flutter build web

# Linux Desktop (accesso completo a Rust)
flutter run -d linux
```

!!! info "Prossimo Passo"
    Vedere la pagina [Architettura](../architecture.md) per capire come funziona la libreria unificata.
