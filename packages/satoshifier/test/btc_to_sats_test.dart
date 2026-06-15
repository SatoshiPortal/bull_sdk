import 'package:flutter_test/flutter_test.dart';
import 'package:satoshifier/utils/utils.dart';

void main() {
  group('btcToSats', () {
    test('converts whole BTC to sats', () {
      expect(Utils.btcToSats('1'), 100000000);
      expect(Utils.btcToSats('0'), 0);
      expect(Utils.btcToSats('21'), 2100000000);
    });

    test('converts BTC with decimals to sats', () {
      expect(Utils.btcToSats('0.00000001'), 1);
      expect(Utils.btcToSats('1.00000001'), 100000001);
      expect(Utils.btcToSats('0.12345678'), 12345678);
      expect(Utils.btcToSats('2.5'), 250000000);
      expect(Utils.btcToSats('0.1'), 10000000);
    });

    test('pads or truncates decimals to 8 digits', () {
      expect(Utils.btcToSats('0.1'), 10000000);
      expect(Utils.btcToSats('0.000000019'), 1);
      expect(Utils.btcToSats('0.123456789'), 12345678);
    });

    test('throws FormatException for invalid input', () {
      expect(() => Utils.btcToSats('abc'), throwsFormatException);
      expect(() => Utils.btcToSats('1.2.3'), throwsFormatException);
      expect(() => Utils.btcToSats(''), throwsFormatException);
    });
  });
}
