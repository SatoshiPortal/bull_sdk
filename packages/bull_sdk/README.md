# bull_sdk

Unified Flutter Rust Bridge bindings for Bitcoin and Liquid wallet operations. Flutter 3.50 / Dart 3.14 builds and bundles the Rust library through Native Assets.

```dart
import 'package:bull_sdk/bull_sdk.dart';

await BullSdk.init();
```

The default initializer loads the registered `package:bull_sdk/src/rust/frb_generated.io.dart` code asset. An explicit `externalLibrary` still selects a caller-provided library; `initMock` remains available for tests. Native Assets builds the Rust library; the legacy CargoKit and downloaded Rust-library paths are removed.

After changing the Rust API, run `flutter_rust_bridge_codegen generate` with version 2.13.0, followed by `bash fix_frb_generated.sh`. The post-processing preserves external error/type conversions, checked unsigned integers and Native Assets loading. Commit the generated bridge separately.

Apple packaging and signing require a full Xcode build on macOS.
