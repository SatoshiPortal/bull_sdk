import 'package:flutter_test/flutter_test.dart';
import 'package:satoshifier/enums/network.dart';

void main() {
  group('Network', () {
    test('classifies signet and regtest as test networks', () {
      expect(Network.bitcoinSignet.isTestnet, isTrue);
      expect(Network.bitcoinRegtest.isTestnet, isTrue);
    });

    test('classifies only mainnet as production', () {
      expect(Network.bitcoinMainnet.isMainnet, isTrue);
      expect(Network.liquidMainnet.isMainnet, isTrue);

      expect(Network.bitcoinTestnet.isMainnet, isFalse);
      expect(Network.bitcoinSignet.isMainnet, isFalse);
      expect(Network.bitcoinRegtest.isMainnet, isFalse);
      expect(Network.liquidTestnet.isMainnet, isFalse);
    });

    test('isTestnet is the exact complement of isMainnet', () {
      for (final network in Network.values) {
        expect(
          network.isTestnet,
          !network.isMainnet,
          reason: '$network must be either mainnet or a test network',
        );
      }
    });
  });
}
