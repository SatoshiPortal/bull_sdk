import 'package:flutter_test/flutter_test.dart';
import 'package:satoshifier/satoshifier.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final validLnurls = [
    TestValue.lnurlUppercase,
    TestValue.lnurlLowercase,
    TestValue.lnAddressUppercase,
    TestValue.lnAddressLowercase,
  ];

  group('LNURL', () {
    test('parses all', () async {
      for (final lnurl in validLnurls) {
        final result = await Satoshifier.parse(lnurl);
        expect(result, isNotNull);
      }
    });
  });
}
