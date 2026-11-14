import 'dart:io' show Platform;
import 'package:material_ui/material_ui.dart';
import 'package:bitbox_transport/bitbox_transport.dart';
import 'package:bull_sdk/bitbox.dart' as bitbox;

void main() {
  runApp(const BitBoxExample());
}

class BitBoxExample extends StatelessWidget {
  const BitBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BitBox Connectors',
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _initialized = false;
  final List<String> _logs = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _log('Initializing...');
    await BitBoxApi.initialize();
    setState(() => _initialized = true);
    _log('Ready');
  }

  void _log(String msg) {
    debugPrint('[BitBox] $msg');
    setState(() => _logs.add(msg));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BitBox Connectors')),
      body: Column(
        children: [
          if (_initialized)
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: Platform.isAndroid ? _scanUsb : _scanBle,
                  icon: Icon(Platform.isAndroid ? Icons.usb : Icons.bluetooth),
                  label: Text(Platform.isAndroid ? 'Scan USB' : 'Scan BLE'),
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _logs.length,
              itemBuilder: (_, i) => Text(
                _logs[i],
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'monospace',
                  color: _logs[i].startsWith('ERROR')
                      ? Colors.red
                      : _logs[i].startsWith('OK')
                          ? Colors.green
                          : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── USB ──

  Future<void> _scanUsb() async {
    _log('Scanning USB devices...');
    try {
      final devices = await BitBoxApi.scanDevices();
      if (devices.isEmpty) {
        _log('No USB devices found');
        return;
      }
      for (final d in devices) {
        _log('Found: ${d.product} (${d.serialNumber})');
      }
      final device = devices.first;
      await _connectUsb(device);
    } catch (e) {
      _log('ERROR: $e');
    }
  }

  Future<void> _connectUsb(BitBox02Device device) async {
    _log('Requesting permission for ${device.deviceName}...');
    final permitted =
        await BitBoxApi.requestPermission(device.deviceName);
    if (!permitted) {
      _log('ERROR: Permission denied');
      return;
    }

    _log('Opening ${device.product}...');
    final opened = await BitBoxApi.openDevice(
      device.deviceName,
      device.serialNumber,
    );
    if (!opened) {
      _log('ERROR: Failed to open device');
      return;
    }
    _log('OK device opened');

    await _pair(device.serialNumber, isUsb: true);
  }

  // ── BLE ──

  final _bleConnector = BleConnector();

  Future<void> _scanBle() async {
    _log('Scanning BLE devices (10s)...');
    try {
      final devices = await _bleConnector.scanDevices(
        timeout: const Duration(seconds: 10),
      );
      if (devices.isEmpty) {
        _log('No BLE devices found');
        return;
      }
      for (final d in devices) {
        _log('Found: ${d.name ?? "unknown"} (${d.deviceId})');
      }
      final device = devices.first;
      await _connectBle(device);
    } catch (e) {
      _log('ERROR: $e');
    }
  }

  Future<void> _connectBle(BitBox02BleDevice device) async {
    final serialNumber = device.deviceId;
    _log('Connecting BLE to ${device.name ?? device.deviceId}...');

    final connected = await _bleConnector.connect(
      deviceId: device.deviceId,
      serialNumber: serialNumber,
    );
    if (!connected) {
      _log('ERROR: BLE connection failed');
      return;
    }
    _log('OK BLE connected');

    final product = await _bleConnector.readProductInfo();
    if (product != null) _log('Product: $product');

    await _pair(serialNumber, isUsb: false);
  }

  // ── Pairing (same for USB & BLE) ──

  Future<void> _pair(String serialNumber, {required bool isUsb}) async {
    _log('Starting pairing...');
    try {
      final code = await bitbox.startPairing(serialNumber: serialNumber);
      if (code == null) {
        _log('ERROR: No pairing code');
        return;
      }
      _log('Pairing code: $code');
      _log('Confirm on BitBox02...');

      final confirmed = await bitbox.confirmPairing(serialNumber: serialNumber);
      if (!confirmed) {
        _log('ERROR: Pairing rejected');
        return;
      }
      _log('OK paired');

      final fp = await bitbox.getRootFingerprint(serialNumber: serialNumber);
      _log('OK fingerprint: $fp');

      final info = await bitbox.getDeviceInfo(serialNumber: serialNumber);
      _log(
          'OK device: ${info.name} v${info.version} (initialized: ${info.initialized})');
    } catch (e) {
      _log('ERROR: $e');
    } finally {
      _log('Cleaning up...');
      if (isUsb) {
        await BitBoxApi.closeDevice(serialNumber);
      } else {
        await _bleConnector.disconnect();
      }
      _log('Done');
    }
  }
}
