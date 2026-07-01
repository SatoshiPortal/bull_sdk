# Inicio Rápido

## Inicializar el SDK

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

## Ejemplo: Crear un Swap Lightning

```dart
import 'package:bull_sdk/boltz.dart' as boltz;

// Crear un swap submárico (onchain → lightning)
final swap = await boltz.BtcLnSwap.newSubmarine(
  swapMasterKey: masterKey,
  index: BigInt.zero,
  invoice: invoice,
  network: boltz.Chain.bitcoin,
  electrumUrl: 'electrum.blockstream.info:50002',
  boltzUrl: 'https://boltz.exchange',
);

// Obtener la dirección de fondeo
final address = swap.scriptAddress;

// Después de fondear, reclamar el swap
final txid = await swap.claim(
  outAddress: 'bc1q...',
  minerFee: boltz.TxFee.absolute(BigInt.from(5000)),
  tryCooperate: true,
);
```

## Ejemplo: Operaciones con Billetera Liquid

```dart
import 'package:bull_sdk/lwk.dart' as lwk;

// Inicializar una billetera Liquid
final wallet = await lwk.Wallet.init(
  network: lwk.LiquidNetwork.mainnet,
  dbpath: '/ruta/a/wallet.db',
  descriptor: descriptor,
);

// Sincronizar con servidor electrum
await wallet.sync_(
  electrumUrl: 'blockstream.info:995',
  validateDomain: false,
);

// Obtener saldos
final balances = await wallet.balances();

// Construir una transacción
final pset = await wallet.buildLbtcTx(
  sats: BigInt.from(100000),
  outAddress: 'lq1qq...',
  feeRate: 1.0,
  drain: false,
);
```

## Compilar para Desarrollo

```bash
# Web (más rápido — solo Dart, sin Rust)
cd packages/bull_sdk
flutter build web

# Linux Desktop (acceso completo a Rust)
flutter run -d linux
```

!!! info "Siguiente Paso"
    Ver la página de [Arquitectura](../architecture.md) para entender cómo funciona la biblioteca unificada.
