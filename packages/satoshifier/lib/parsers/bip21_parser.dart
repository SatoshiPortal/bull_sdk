import 'package:bip21_uri/bip21_uri.dart';
import 'package:satoshifier/satoshifier.dart';

class Bip21Parser {
  static Future<Satoshifier> parse(String data) async {
    final uri = bip21.decode(data);

    Network network;
    switch (uri.scheme.toLowerCase()) {
      case 'bitcoin':
        final address = await BitcoinAddressParser.parse(uri.address);
        network = (address as BitcoinAddress).network;
      case 'liquid':
        final address = await LiquidAddressParser.parse(uri.address);
        network = (address as LiquidAddress).network;
      case 'liquidnetwork':
        final address = await LiquidAddressParser.parse(uri.address);
        network = (address as LiquidAddress).network;
      case 'liquidtestnet':
        final address = await LiquidAddressParser.parse(uri.address);
        network = (address as LiquidAddress).network;
      default:
        throw 'Unhandled scheme: ${uri.scheme} ${uri.address} not verified';
    }
    final amount = uri.amount;
    final sats = amount != null ? Utils.btcToSats(amount.toString()) : 0;

    return Satoshifier.bip21(
      scheme: uri.scheme,
      address: uri.address,
      uri: uri.toString(),
      network: network,
      label: uri.label ?? '',
      message: uri.message ?? '',
      sats: sats,
      lightning: uri.options['lightning'] as String? ?? '',
      pj: uri.options['pj'] as String? ?? '',
      pjos: uri.options['pjos'] as String? ?? '',
    );
  }

  static Future<Satoshifier?> tryParse(String data) async {
    try {
      return await parse(data);
    } catch (_) {
      return null;
    }
  }
}
