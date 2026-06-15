import 'package:bull_sdk/boltz.dart' as boltz;
import 'package:satoshifier/satoshifier.dart';

class Bolt11Parser {
  static Future<Satoshifier> parse(String data) async {
    try {
      final input =
          Utils.isUppercaseAlphanumeric(data) ? data.toLowerCase() : data;

      final invoice = await boltz.DecodedInvoice.fromString(s: input);
      final sats = invoice.msats.toInt() ~/ 1000;

      return Satoshifier.bolt11(
        invoice: data,
        sats: sats,
        paymentHash: invoice.preimageHash,
        description: invoice.description,
        expiresAt: invoice.expiresAt.toInt(),
        isTestnet: invoice.network != 'bitcoin',
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<Satoshifier?> tryParse(String data) async {
    try {
      return await parse(data);
    } catch (_) {
      return null;
    }
  }
}
