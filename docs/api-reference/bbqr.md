# BBQr — QR Code Encoding

Animated QR code encoding and decoding for transmitting large data (PSBTs, transactions) via QR codes.

**Import:** `package:bull_sdk/bbqr.dart`

---

## Overview

BBQr splits large binary data into multiple QR frames that can be animated on screen. The receiver collects all frames and reconstructs the original data.

**Use cases:**

- Transmitting PSBTs between air-gapped devices
- Sharing transaction data visually
- Any large payload that needs QR-based transfer

---

## Encoding

### Split Data into QR Frames

```dart
final parts = await bbqr.split(
  data: yourBytes,
  encoding: bbqr.Encoding.zlib,  // best compression
  fileType: bbqr.FileType.psbt,
);
```

### Encoding Options

| Encoding | Description |
|----------|-------------|
| `hex` | Hexadecimal encoding |
| `base32` | Base32 encoding |
| `zlib` | Zlib compression (recommended — smallest QR codes) |

### File Types

| Type | Use case |
|------|----------|
| `psbt` | Partially Signed Bitcoin Transaction |
| `transaction` | Signed transaction |
| `other` | Generic binary data |

---

## Decoding

### Join QR Frames

```dart
final data = await bbqr.join(parts: collectedParts);
```

### Continuous Join (Streaming)

For real-time QR scanning where frames arrive one at a time:

```dart
final joiner = bbqr.ContinuousJoin();

// As each QR frame is scanned
joiner.addFrame(frame: qrData);

// Check if complete
if (joiner.isComplete) {
  final data = joiner.finish();
}
```

---

## QR Generation

```dart
// Generate a QR code image for a single frame
final qrImage = await bbqr.generateQr(
  data: parts[0],
  size: 300,
);
```

---

## Gotchas

- **Order matters**: Frames must be joined in the correct order. BBQr includes sequence numbers in the data.
- **Encoding choice**: Use `zlib` for smallest QR codes. Use `hex` if the receiver doesn't support zlib.
- **Frame count**: More data = more frames. Keep individual frames under 100 bytes for reliable scanning.
- **Error correction**: QR codes have built-in error correction, but damaged frames may still fail.
