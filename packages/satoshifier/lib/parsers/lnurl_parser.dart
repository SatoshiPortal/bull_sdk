import 'package:bull_sdk/boltz.dart' as boltz;
import 'package:satoshifier/satoshifier.dart';

class LnurlParser {
  static Future<Satoshifier> parse(String input) async {
    try {
      final isEmail = input.contains('@');
      final isPrefixed = input.toLowerCase().startsWith('lnurl');

      if (!isEmail && !isPrefixed) throw 'Invalid LNURL: $input';

      final lnurl = boltz.Lnurl(value: input);
      final isValid = await lnurl.validate();
      if (!isValid) throw 'Invalid LNURL: $input';

      return Satoshifier.lnurl(address: input);
    } catch (_) {
      rethrow;
    }
  }

  static Future<Satoshifier?> tryParse(String input) async {
    try {
      return await parse(input);
    } catch (_) {
      return null;
    }
  }
}
