import 'package:satoshifier/satoshifier.dart';

class Descriptor {
  final ScriptOperand operand;
  final String fingerprint;
  final String pubkey;
  final Network network;
  final Derivation derivation;
  final int account;

  Descriptor({
    required this.operand,
    required this.fingerprint,
    required this.pubkey,
    required this.network,
    required this.derivation,
    required this.account,
  });

  String get origin {
    if (fingerprint.isEmpty) return '';
    return '[$fingerprint/${derivation.purpose}/${coinType.value}h/${account}h]';
  }

  bool get _isShwpkh => operand == ScriptOperand.shwpkh;

  String get combined {
    return "${operand.value}($origin$pubkey/<0;1>/*)${_isShwpkh ? ')' : ''}";
  }

  String get internal {
    return "${operand.value}($origin$pubkey/1/*)${_isShwpkh ? ')' : ''}";
  }

  String get external {
    return "${operand.value}($origin$pubkey/0/*)${_isShwpkh ? ')' : ''}";
  }

  CoinType get coinType =>
      network.isBitcoin
          ? network == Network.bitcoinMainnet
              ? CoinType.bitcoin
              : CoinType.testnet
          : CoinType.liquid;

  static Descriptor parse(String string) {
    final descriptor = string.trim();
    try {
      return fromCombinedDescriptor(descriptor);
    } catch (_) {}

    try {
      return fromExternalDescriptor(descriptor);
    } catch (_) {}

    try {
      return parseExtendedPublicKeyWithKeyOrigin(descriptor);
    } catch (_) {}

    throw 'Invalid descriptor format: $descriptor';
  }

  static Descriptor fromCombinedDescriptor(String descriptor) {
    final combinedDescriptorPattern = RegExp(
      r'(\w+)\(\[([a-fA-F0-9]+)/([0-9]+h)/([0-9]+h)/([0-9]+h)\]/?([^/<]+)',
    );

    return parseDescriptorWithOrigin(
      pattern: combinedDescriptorPattern,
      descriptor: descriptor,
      errorMessage: 'Not a combined descriptor: $descriptor',
      useOperandFromRegex: false,
    );
  }

  static Descriptor fromExternalDescriptor(String descriptor) {
    final externalDescriptorPattern = RegExp(
      r"(\w+(?:\(\w+)?)\(\[([a-fA-F0-9]+)/([0-9]+[\'h])/([0-9]+[\'h])/([0-9]+[\'h])\]([^/]+)/0/\*\)(?:#[a-zA-Z0-9]+)?$",
    );

    return parseDescriptorWithOrigin(
      pattern: externalDescriptorPattern,
      descriptor: descriptor,
      errorMessage: 'Not an external descriptor: $descriptor',
      useOperandFromRegex: true,
    );
  }

  static Descriptor fromExtendedPubkey(ExtendedPubkey extendedPubkey) {
    return Descriptor(
      operand: ScriptOperand.fromExtendedPubkey(extendedPubkey),
      fingerprint: '',
      pubkey: extendedPubkey.xpub,
      network: extendedPubkey.network,
      derivation: extendedPubkey.derivation,
      account: 0,
    );
  }

  static Descriptor fromStrings({
    required String fingerprint,
    required String path,
    required String xpub,
  }) {
    final convertedPath = path.startsWith('m/') ? path.substring(2) : path;

    final pathParts = convertedPath.split('/');
    if (pathParts.length < 3) {
      throw 'Invalid descriptor format: insufficient path components';
    }

    final purpose = pathParts[0];
    final coinTypeString = pathParts[1];
    final accountString = pathParts[2];

    final coinTypeInt = int.parse(Utils.trimLastQuoteOrH(coinTypeString));
    final account = int.parse(Utils.trimLastQuoteOrH(accountString));

    final derivation = Derivation.fromPurpose(purpose);
    final coinType = CoinType.fromInt(coinTypeInt);
    final network = coinType.toNetwork();
    final operand = switch (derivation) {
      Derivation.bip44 => ScriptOperand.pkh,
      Derivation.bip49 => ScriptOperand.shwpkh,
      Derivation.bip84 => ScriptOperand.wpkh,
    };

    return Descriptor(
      operand: operand,
      fingerprint: fingerprint,
      pubkey: xpub,
      network: network,
      derivation: derivation,
      account: account,
    );
  }

  static Descriptor parseDescriptorWithOrigin({
    required RegExp pattern,
    required String descriptor,
    required String errorMessage,
    required bool useOperandFromRegex,
  }) {
    final match = pattern.firstMatch(descriptor.trim());

    if (match == null) throw errorMessage;

    final operandString = match.group(1)!;
    final fingerprint = match.group(2)!;
    final derivationPurpose = match.group(3)!;
    final coinTypeString = match.group(4)!;
    final accountString = match.group(5)!;
    final pubkey = match.group(6)!;

    final operand =
        useOperandFromRegex
            ? ScriptOperand.fromDescriptor(operandString)
            : ScriptOperand.fromDescriptor(descriptor);
    final derivation = Derivation.fromPurpose(derivationPurpose);
    final coinTypeInt = int.parse(Utils.trimLastQuoteOrH(coinTypeString));
    final coinType = CoinType.fromInt(coinTypeInt);
    final network = coinType.toNetwork();
    final account = int.parse(Utils.trimLastQuoteOrH(accountString));

    return Descriptor(
      operand: operand,
      fingerprint: fingerprint,
      pubkey: pubkey,
      network: network,
      derivation: derivation,
      account: account,
    );
  }

  static Descriptor parseExtendedPublicKeyWithKeyOrigin(String descriptor) {
    if (!descriptor.startsWith('[') ||
        !descriptor.contains(']') ||
        !descriptor.contains('pub')) {
      throw 'Invalid descriptor format: missing key origin';
    }

    final bracketEnd = descriptor.indexOf(']');
    if (bracketEnd <= 0) {
      throw 'Invalid descriptor format: missing closing bracket';
    }

    final bracketContent = descriptor.substring(1, bracketEnd);
    final parts = bracketContent.split('/');
    if (parts.length < 2) {
      throw 'Invalid descriptor format: insufficient derivation path parts';
    }

    final fingerprint = parts[0];
    final path = parts.sublist(1).join('/');
    final xpub = descriptor.substring(bracketEnd + 1);

    return fromStrings(fingerprint: fingerprint, path: path, xpub: xpub);
  }
}
