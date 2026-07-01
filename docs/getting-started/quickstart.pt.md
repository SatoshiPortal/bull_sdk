# Início Rápido

## Inicializar o SDK

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

## Exemplo: Criar um Swap Lightning

```dart
import 'package:bull_sdk/boltz.dart' as boltz;

// Criar um swap submarine (onchain → lightning)
final swap = await boltz.BtcLnSwap.newSubmarine(
  swapMasterKey: masterKey,
  index: BigInt.zero,
  invoice: invoice,
  network: boltz.Chain.bitcoin,
  electrumUrl: 'electrum.blockstream.info:50002',
  boltzUrl: 'https://boltz.exchange',
);

// Obter o endereço de funding
final address = swap.scriptAddress;

// Após o funding, reivindicar o swap
final txid = await swap.claim(
  outAddress: 'bc1q...',
  minerFee: boltz.TxFee.absolute(BigInt.from(5000)),
  tryCooperate: true,
);
```

## Exemplo: Operações com Carteira Liquid

```dart
import 'package:bull_sdk/lwk.dart' as lwk;

// Inicializar uma carteira Liquid
final wallet = await lwk.Wallet.init(
  network: lwk.LiquidNetwork.mainnet,
  dbpath: '/caminho/para/wallet.db',
  descriptor: descriptor,
);

// Sincronizar com servidor electrum
await wallet.sync_(
  electrumUrl: 'blockstream.info:995',
  validateDomain: false,
);

// Obter saldos
final balances = await wallet.balances();

// Construir uma transação
final pset = await wallet.buildLbtcTx(
  sats: BigInt.from(100000),
  outAddress: 'lq1qq...',
  feeRate: 1.0,
  drain: false,
);
```

## Compilar para Desenvolvimento

```bash
# Web (mais rápido — apenas Dart, sem Rust)
cd packages/bull_sdk
flutter build web

# Linux Desktop (acesso completo ao Rust)
flutter run -d linux
```

!!! info "Próximo Passo"
    Ver a página de [Arquitetura](../architecture.md) para entender como funciona a biblioteca unificada.
