import 'package:bull_sdk/bdk.dart';
import 'package:flutter_test/flutter_test.dart';

// BIP84 test vectors: https://github.com/bitcoin/bips/blob/master/bip-0084.mediawiki
// A bdk_dart bump must never change the addresses of existing wallets.
// These cases follow the three ways the app builds BIP84 descriptors:
// from a mnemonic, from an xprv, and watch-only from an account xpub.
const _mnemonic =
    'abandon abandon abandon abandon abandon abandon abandon abandon abandon '
    'abandon abandon about';
// BIP84 rootpriv and account zpub, re-encoded with xprv/xpub version bytes.
const _rootXprv =
    'xprv9s21ZrQH143K3GJpoapnV8SFfukcVBSfeCficPSGfubmSFDxo1kuHnLisriDvSnRRuL2Qrg5ggqHKNVpxR86QEC8w35uxmGoggxtQTPvfUu';
const _accountXpub =
    'xpub6CatWdiZiodmUeTDp8LT5or8nmbKNcuyvz7WyksVFkKB4RHwCD3XyuvPEbvqAQY3rAPshWcMLoP2fMFMKHPJ4ZeZXYVUhLv1VMrjPC7PW6V';
const _fingerprint = '73c5da0a';

const _receive0 = 'bc1qcr8te4kr609gcawutmrza0j4xv80jy8z306fyu';
const _receive1 = 'bc1qnjg0jd8228aq7egyzacy8cys3knf9xvrerkf9g';
const _change0 = 'bc1q8c6fshw2dlwun7ekn9qwf37cu2rn755upcp6el';

void _expectVectors(Descriptor external, Descriptor internal) {
  String address(Descriptor descriptor, int index) => descriptor
      .deriveAddress(index: index, network: Network.bitcoin)
      .toString();

  expect(address(external, 0), _receive0);
  expect(address(external, 1), _receive1);
  expect(address(internal, 0), _change0);
  expect(
    external.toString().split('#').first,
    "wpkh([$_fingerprint/84'/0'/0']$_accountXpub/0/*)",
  );
}

void main() {
  test('BIP84 vectors from a mnemonic', () {
    final secretKey = DescriptorSecretKey(
      networkKind: NetworkKind.main,
      mnemonic: Mnemonic.fromString(mnemonic: _mnemonic),
      password: null,
    );
    Descriptor build(KeychainKind keychain) => Descriptor.newBip84(
      secretKey: secretKey,
      keychainKind: keychain,
      networkKind: NetworkKind.main,
    );

    _expectVectors(build(KeychainKind.external_), build(KeychainKind.internal));
  });

  test('BIP84 vectors from a root xprv', () {
    final secretKey = DescriptorSecretKey.fromString(privateKey: _rootXprv);
    Descriptor build(KeychainKind keychain) => Descriptor.newBip84(
      secretKey: secretKey,
      keychainKind: keychain,
      networkKind: NetworkKind.main,
    );

    _expectVectors(build(KeychainKind.external_), build(KeychainKind.internal));
  });

  test('BIP84 vectors from a watch-only account xpub', () {
    final publicKey = DescriptorPublicKey.fromString(publicKey: _accountXpub);
    Descriptor build(KeychainKind keychain) => Descriptor.newBip84Public(
      publicKey: publicKey,
      fingerprint: _fingerprint,
      keychainKind: keychain,
      networkKind: NetworkKind.main,
    );

    _expectVectors(build(KeychainKind.external_), build(KeychainKind.internal));
  });
}
