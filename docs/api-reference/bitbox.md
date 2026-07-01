# Bitbox — Hardware Wallet

Integration with [Bitbox](https://bitbox.swiss/) hardware wallets.

**Import:** `package:bull_sdk/bitbox.dart`

---

## Overview

The Bitbox module provides communication with Bitbox hardware wallets for secure key management and transaction signing.

---

## API

```dart
import 'package:bull_sdk/bitbox.dart' as bitbox;

// Initialize connection to hardware wallet
// (API details depend on transport layer — USB/BLE)
```

!!! note "Documentation in progress"
    The Bitbox API surface is generated from Rust and depends on the transport layer (`bitbox-transport` package). Detailed method reference will be added as the API stabilizes.

---

## Supported Operations

| Operation | Description |
|-----------|-------------|
| Device detection | Discover connected Bitbox devices |
| Key derivation | Derive public keys from device |
| Transaction signing | Sign transactions on-device |
| Device info | Get firmware version and device status |

---

## Transport Layer

Bitbox communication uses the `bitbox-transport` package for USB and BLE connectivity:

```yaml
dependencies:
  bitbox_transport:
    path: ../bitbox-transport
```

---

## Gotchas

- **Physical access required**: Hardware wallet operations require physical device interaction (button presses).
- **Transport permissions**: On mobile, BLE requires user permission. On desktop, USB requires proper udev rules (Linux).
- **Firmware compatibility**: Ensure the Bitbox firmware version supports the operations you need.
