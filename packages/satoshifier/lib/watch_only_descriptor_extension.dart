import 'package:convert/convert.dart';
import 'package:satoshifier/satoshifier.dart';

extension WatchOnlyDescriptorExtension on WatchOnlyDescriptor {
  ExtendedPubkey get extendedPubkey => ExtendedPubkey.parse(descriptor.pubkey);

  String get masterFingerprint => descriptor.fingerprint;
  String get pubkeyFingerprint => extendedPubkey.fingerprint;

  bool get canGeneratePsbt {
    if (masterFingerprint.isEmpty) return false;
    if (masterFingerprint == pubkeyFingerprint) return false;
    if (masterFingerprint.length != 8) return false;
    if (hex.decode(masterFingerprint).length != 4) return false;
    return true;
  }
}
