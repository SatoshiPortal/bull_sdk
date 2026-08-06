import 'package:bull_sdk/bitbox.dart' as api;
import 'package:bull_sdk/bull_sdk.dart';
import 'platform.dart';
import 'usb_connector.dart';

class BitBoxApi {
  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    await BullSdk.init();
    _initialized = true;
  }

  static Future<List<BitBox02Device>> scanDevices() async {
    _ensureInitialized();
    return await BitBoxFlutterPlatform.scanDevices();
  }

  static Future<bool> requestPermission(String deviceName) async {
    _ensureInitialized();
    return await BitBoxFlutterPlatform.requestPermission(deviceName);
  }

  static Future<bool> openDevice(String deviceName, String serialNumber) async {
    _ensureInitialized();

    final opened = await BitBoxFlutterPlatform.openDevice(deviceName);
    if (!opened) {
      return false;
    }

    UsbConnector().start(deviceSerial: serialNumber);

    return true;
  }

  static Future<String?> startPairing(String serialNumber) async {
    _ensureInitialized();
    return await api.startPairing(serialNumber: serialNumber);
  }

  static Future<bool> confirmPairing(String serialNumber) async {
    _ensureInitialized();
    return await api.confirmPairing(serialNumber: serialNumber);
  }

  static Future<String> getRootFingerprint(String serialNumber) async {
    _ensureInitialized();
    return await api.getRootFingerprint(serialNumber: serialNumber);
  }

  /// Fetches an account extended public key from the device.
  ///
  /// [xpubType] is required on purpose: it used to default to `xpub`, so a
  /// BIP84 or BIP49 account silently came back with a legacy prefix and any
  /// consumer reading the prefix built a watch-only wallet on the wrong
  /// script type. Pass [BitBoxKeypath.xpubTypeFor] unless you deliberately
  /// want a different encoding.
  static Future<String> getBtcXpub({
    required String serialNumber,
    required String keypath,
    required String xpubType,
  }) async {
    _ensureInitialized();
    return await api.getBtcXpub(
      serialNumber: serialNumber,
      keypath: keypath,
      xpubType: xpubType,
    );
  }

  static Future<String> verifyAddress({
    required String serialNumber,
    required String keypath,
    bool testnet = false,
    String scriptType = 'p2wpkh',
  }) async {
    _ensureInitialized();
    return await api.verifyAddress(
      serialNumber: serialNumber,
      keypath: keypath,
      testnet: testnet,
      scriptType: scriptType,
    );
  }

  static Future<String> signPsbt({
    required String serialNumber,
    required String psbt,
    bool testnet = false,
  }) async {
    _ensureInitialized();
    return await api.signPsbt(
      serialNumber: serialNumber,
      psbtStr: psbt,
      testnet: testnet,
    );
  }

  static Future<void> closeDevice(String serialNumber) async {
    _ensureInitialized();

    UsbConnector().stop();

    await api.closeUsbChannel(serialNumber: serialNumber);

    await api.closeDevice(serialNumber: serialNumber);

    await BitBoxFlutterPlatform.closeDevice();
  }

  static void _ensureInitialized() {
    if (!_initialized) {
      throw StateError('BitBoxApi not initialized. Call initialize() first.');
    }
  }
}
