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

  /// Converts a BOLT11 millisatoshi amount to satoshis, rounding up.
  ///
  /// The conversion is lossy by construction: BOLT11 denominates in msats and
  /// the pico-BTC multiplier makes sub-satoshi amounts expressible. Rounding
  /// up rather than truncating keeps two properties that callers rely on — a
  /// non-zero invoice never reads as zero (which would look like an amountless
  /// invoice), and the satoshi view never understates what is owed. Use the
  /// msat value itself wherever the amount must be exact.
  static int msatsToSats(int msats) {
    if (msats < 0) {
      throw FormatException('Invalid msats amount: $msats');
    }
    final sats = (msats + 999) ~/ 1000;
    _checkSatsBounds(sats);
    return sats;
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
