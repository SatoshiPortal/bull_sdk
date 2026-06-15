class Utils {
  static int btcToSats(String bitcoins) {
    final parts = bitcoins.split('.');
    if (parts.length == 1) {
      final sats = int.parse(parts[0]) * 100000000;
      _checkSatsBounds(sats);
      return sats;
    } else if (parts.length == 2) {
      final whole = int.parse(parts[0]) * 100000000;
      final decimal = parts[1].padRight(8, '0').substring(0, 8);
      final sats = whole + int.parse(decimal);
      _checkSatsBounds(sats);
      return sats;
    }
    throw FormatException('Invalid BTC amount format');
  }

  static void _checkSatsBounds(int sats) {
    const twoPointOneQuadrillion = 2_100_000_000_000_000;
    if (sats < 0 || sats > twoPointOneQuadrillion) {
      throw FormatException('Invalid sats amount');
    }
  }

  static String trimLastQuoteOrH(String string) {
    if (string.endsWith("'") || string.endsWith("h")) {
      return string.substring(0, string.length - 1);
    }
    return string;
  }

  static bool isUppercaseAlphanumeric(String string) {
    return RegExp(r'^[A-Z0-9]+$').hasMatch(string);
  }
}
