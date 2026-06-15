import 'dart:typed_data';

import 'package:bs58/bs58.dart';
import 'package:convert/convert.dart';
import 'package:satoshifier/satoshifier.dart';

class ExtendedPubkey {
  final List<int> pubkey;
  final XpubType type;
  final Derivation derivation;
  final Network network;

  ExtendedPubkey({
    required this.pubkey,
    type,
    required this.derivation,
    required this.network,
  }) : type = XpubType.fromDerivation(derivation, network);

  // Returns the base58 encoded xpub / ypub / zpub depending on the type
  String get pubBase58 => base58.encode(Uint8List.fromList(pubkey));
  String get xpub => Bip32Utils.convertToXpub(pubkey);

  String get fingerprint => hex.encode(Bip32Utils.fingerprint(pubkey, type));

  static ExtendedPubkey parse(String string) {
    final pubkey = base58.decode(string);
    final type = XpubType.fromString(string);
    final derivation = Derivation.fromXpubType(type);
    final network = Network.fromXpubType(type);
    return ExtendedPubkey(
      type: type,
      derivation: derivation,
      pubkey: pubkey,
      network: network,
    );
  }

  static ExtendedPubkey? tryParse(String string) {
    try {
      return parse(string);
    } catch (e) {
      return null;
    }
  }
}
