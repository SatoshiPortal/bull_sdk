import 'dart:io';

import 'package:bull_sdk/bull_sdk.dart';
import 'package:bull_sdk/lwk.dart' as lwk;
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:flutter_test/flutter_test.dart';

String _nativeLibraryPath() {
  if (Platform.isMacOS) {
    return '../../target/release/librust_lib_bull_sdk.dylib';
  }
  if (Platform.isWindows) {
    return '../../target/release/rust_lib_bull_sdk.dll';
  }
  return '../../target/release/librust_lib_bull_sdk.so';
}

void main() {
  group('LWK address blinding secret', () {
    late Directory dbDirectory;

    setUpAll(() async {
      dbDirectory = await Directory.systemTemp.createTemp(
        'bull_sdk_lwk_address_blinding_secret_',
      );
      await BullSdk.init(
        externalLibrary: ExternalLibrary.open(_nativeLibraryPath()),
      );
    });

    tearDownAll(() async {
      await dbDirectory.delete(recursive: true);
    });

    test('is exposed as a generated address/secret pair', () async {
      const mnemonic =
          'umbrella response wide outer mystery drastic crew festival poet coconut error act';
      const network = lwk.LiquidNetwork.testnet;
      final descriptor = await lwk.Descriptor.newConfidential(
        network: network,
        mnemonic: mnemonic,
      );
      final wallet = await lwk.Wallet.init(
        network: network,
        dbpath: dbDirectory.path,
        descriptor: descriptor,
      );

      final first = await wallet.addressWithBlindingSecret(index: 0);
      final second = await wallet.addressWithBlindingSecret(index: 1);

      expect(first.blindingSecret, matches(RegExp(r'^[0-9a-f]{64}$')));
      expect(first.address.index, 0);
      expect(first.address.blindingKey, isNotNull);
      expect(second.address.index, 1);
      expect(second.address.confidential, isNot(first.address.confidential));
      expect(second.blindingSecret, isNot(first.blindingSecret));
    });
  });
}
