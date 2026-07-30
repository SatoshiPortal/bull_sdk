import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:onion/onion.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('starts and stops the local SOCKS listener', (tester) async {
    await OnionCore.init();
    final root = await Directory.systemTemp.createTemp('onion_test_');
    final service = await TorService.start(
      stateDir: '${root.path}/state',
      cacheDir: '${root.path}/cache',
      socksPort: 0,
    );

    expect(await service.socksPort(), greaterThan(0));
    expect(await service.proxyIsAlive(), isTrue);

    await service.stop();
    expect(await service.proxyIsAlive(), isFalse);
  });
}
