import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onion/onion.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnionCore.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status = 'Not started';
  TorService? _service;

  @override
  void dispose() {
    unawaited(_service?.stop());
    super.dispose();
  }

  Future<void> _startProxy() async {
    setState(() => _status = 'Starting');
    try {
      final root = await Directory.systemTemp.createTemp('onion_example_');
      final service = await TorService.start(
        stateDir: '${root.path}/state',
        cacheDir: '${root.path}/cache',
        socksPort: 0,
        policy: SocksPolicy.any,
      );
      _service = service;
      final port = await service.socksPort();
      if (mounted) setState(() => _status = 'Listening on 127.0.0.1:$port');
    } catch (error) {
      if (mounted) setState(() => _status = 'Failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Onion example')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_status),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _service == null ? _startProxy : null,
                child: const Text('Start local SOCKS proxy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
