# Architecture

## How It Works

Bull SDK is a single `flutter_rust_bridge` (FRB) package that generates unified Dart bindings by scanning the Rust API of each sub-crate as external dependencies.

```
┌─────────────────────────────────────────────┐
│              bull_sdk (Dart)                │
│  lib/ark.dart  lib/boltz.dart  lib/lwk.dart│
├─────────────────────────────────────────────┤
│         frb_generated.rs (unified)          │
│      Single FFI dispatcher for all FFI     │
├─────────────────────────────────────────────┤
│  ark_wallet │ bbqr │ boltz │ lwk │ bitbox  │
│    (Rust external crates via Cargo deps)    │
└─────────────────────────────────────────────┘
```

## Key Design Decisions

### Single Native Library

All Rust code compiles into one `.so` / `.dylib`. This eliminates:
- Duplicate compilation of shared dependencies (bitcoin, secp256k1, tokio, openssl)
- Multiple native library loading at runtime
- Android multi-architecture build multiplication

### Sub-crate FRB is cfg-gated

Each submodule has its own `frb_generated.rs`. When used as a `bull_sdk` dependency, these are disabled via:

```rust
#[cfg(not(feature = "bull_sdk"))]
mod frb_generated;
```

Bull SDK provides its own unified `frb_generated.rs`.

### Mirror Types for Data-Variant Enums

Rust enums with data (like `TxFee`, `ArkTransaction`) become opaque when scanned as external crate types. FRB cannot automatically generate proper Dart classes for them.

Solution: manual mirror types in `packages/bull_sdk/rust/src/api/simple.rs`:

```rust
#[flutter_rust_bridge::frb(mirror(boltz::api::fees::TxFee))]
pub enum TxFee {
    Absolute(u64),
    Relative(f64),
}

impl From<TxFee> for boltz::api::fees::TxFee {
    fn from(val: TxFee) -> boltz::api::fees::TxFee {
        match val {
            TxFee::Absolute(v) => boltz::api::fees::TxFee::Absolute(v),
            TxFee::Relative(v) => boltz::api::fees::TxFee::Relative(v),
        }
    }
}
```

### Post-Processing Script

After FRB codegen, `fix_frb_generated.sh` patches the generated Rust code to:
- Wrap external crate error types in `FrbWrapper`
- Add `.map_err(FrbWrapper)` to closure results
- Convert mirrored types via `.into()`

This is mandatory — without it, the build fails with ~86 type errors.

## Dependency Graph

```
bull_sdk (main package)
├── ark_wallet (git submodule, feature: bull_sdk)
├── bbqr (git submodule)
├── dart_bbqr (git submodule, feature: bull_sdk)
├── boltz (git submodule, feature: bull_sdk)
├── lwk (git submodule, feature: bull_sdk)
└── bitbox (git submodule, feature: bull_sdk)

boltz-stream (pure Dart, depends on bull_sdk)
satoshifier (git submodule, depends on bull_sdk + bdk_dart)
```

## Build Pipeline

```
1. flutter_rust_bridge_codegen generate
   → Reads flutter_rust_bridge.yaml
   → Scans Rust APIs of all sub-crates
   → Generates frb_generated.rs + frb_generated.dart

2. bash fix_frb_generated.sh
   → Patches error type wrapping
   → Adds mirror type conversions

3. cargo check -p rust_lib_bull_sdk
   → Validates Rust compilation

4. flutter build web / flutter run -d linux
   → Compiles Dart + links Rust native library
```
