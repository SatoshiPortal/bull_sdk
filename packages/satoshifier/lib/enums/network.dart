import 'package:bull_sdk/bdk.dart' as bdk;
import 'package:bull_sdk/lwk.dart' as lwk;
import 'package:satoshifier/satoshifier.dart';

enum Network {
  bitcoinMainnet,
  bitcoinTestnet,
  bitcoinSignet,
  bitcoinRegtest,
  liquidMainnet,
  liquidTestnet;

  bool get isBitcoin =>
      this == bitcoinMainnet ||
      this == bitcoinTestnet ||
      this == bitcoinSignet ||
      this == bitcoinRegtest;
  bool get isLiquid => this == liquidMainnet || this == liquidTestnet;

  bdk.Network get toBdk {
    switch (this) {
      case Network.bitcoinMainnet:
        return bdk.Network.bitcoin;
      case Network.bitcoinTestnet:
        return bdk.Network.testnet;
      case Network.bitcoinSignet:
        return bdk.Network.signet;
      case Network.bitcoinRegtest:
        return bdk.Network.regtest;
      default:
        throw 'Non bitcoin network: $this';
    }
  }

  static Network fromBdkNetwork(bdk.Network bdkNetwork) {
    switch (bdkNetwork) {
      case bdk.Network.bitcoin:
        return Network.bitcoinMainnet;
      case bdk.Network.testnet:
      case bdk.Network.testnet4:
        return Network.bitcoinTestnet;
      case bdk.Network.signet:
        return Network.bitcoinSignet;
      case bdk.Network.regtest:
        return Network.bitcoinRegtest;
    }
  }

  static Network fromLwkNetwork(lwk.LiquidNetwork lwkNetwork) {
    switch (lwkNetwork) {
      case lwk.LiquidNetwork.mainnet:
        return Network.liquidMainnet;
      case lwk.LiquidNetwork.testnet:
        return Network.liquidTestnet;
    }
  }

  static Network fromXpubType(XpubType xpubType) {
    if (xpubType == XpubType.xpub ||
        xpubType == XpubType.ypub ||
        xpubType == XpubType.zpub) {
      return Network.bitcoinMainnet;
    }
    if (xpubType == XpubType.tpub ||
        xpubType == XpubType.upub ||
        xpubType == XpubType.vpub) {
      return Network.bitcoinTestnet;
    }

    throw 'Invalid xpub type: $xpubType';
  }

  bool get isTestnet {
    switch (this) {
      case Network.bitcoinMainnet:
        return false;
      case Network.bitcoinSignet:
        return false;
      case Network.liquidMainnet:
        return false;
      case Network.bitcoinRegtest:
        return false;
      case Network.bitcoinTestnet:
        return true;
      case Network.liquidTestnet:
        return true;
    }
  }
}
