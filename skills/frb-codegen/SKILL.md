---
name: frb-codegen
description: "Regenerate flutter_rust_bridge bindings for the bull_sdk unified package. Covers the full workflow: FRB codegen, fix_frb_generated.sh post-processing, cargo check, and troubleshooting. Use when updating Rust APIs, adding new sub-crate types, fixing FRB build errors, or after modifying flutter_rust_bridge.yaml."
license: Apache-2.0
compatibility: Requires flutter_rust_bridge CLI, Rust toolchain 1.95.0, Flutter 3.44.2, Python 3 (for fix_frb_generated.sh)
metadata:
  author: bull-sdk
  version: "1.0"
---

# FRB Codegen for Bull SDK

Regenerate the unified flutter_rust_bridge bindings that produce a single native library from multiple Rust crate APIs.

## When to Use

- After modifying Rust API code in any sub-crate (ark-wallet, bbqr, boltz, lwk, bitbox)
- After updating `flutter_rust_bridge.yaml` inputs
- When FRB build errors mention type mismatches or missing trait implementations
- When adding new mirror types for data-variant Rust enums
- After upgrading flutter_rust_bridge version

## Quick Reference

| Item | Value |
|------|-------|
| Codegen command | `flutter_rust_bridge_codegen generate` |
| Post-processing | `bash fix_frb_generated.sh` |
| Validation | `cargo check -p rust_lib_bull_sdk` |
| FRB config | `packages/bull_sdk/flutter_rust_bridge.yaml` |
| Mirror types | `packages/bull_sdk/rust/src/api/simple.rs` |

## Step-by-Step Instructions

### 1. Run FRB Codegen

```bash
cd packages/bull_sdk
flutter_rust_bridge_codegen generate
```

This scans `rust_input` in `flutter_rust_bridge.yaml` and generates:
- `lib/src/rust/frb_generated.dart` — Dart bindings
- `rust/src/frb_generated.rs` — Rust FFI dispatcher

### 2. Run Post-Processing (MANDATORY)

```bash
cd packages/bull_sdk
bash fix_frb_generated.sh
```

This script patches `rust/src/frb_generated.rs` to:
- Wrap external crate error types in `FrbWrapper` (LwkError, BoltzError)
- Add `.map_err(FrbWrapper)` to closure results
- Convert mirrored `TxFee` via `.into()`
- Convert `Vec<ArkTransaction>` via iterator mapping

### 3. Validate the Build

```bash
cargo check -p rust_lib_bull_sdk
```

This compiles the bridge crate without producing a binary — confirms all types resolve.

### 4. (Optional) Add New Mirror Types

If you added a new data-variant enum to a sub-crate API, create a mirror in `packages/bull_sdk/rust/src/api/simple.rs`:

```rust
#[flutter_rust_bridge::frb(mirror(sub_crate::path::MyEnum))]
pub enum MyEnum {
    Variant1(u64),
    Variant2 { field: String },
}

// Implement From in both directions
impl From<MyEnum> for sub_crate::path::MyEnum { ... }
impl From<sub_crate::path::MyEnum> for MyEnum { ... }
```

Then re-run steps 1-3.

## Gotchas

- **`fix_frb_generated.sh` uses macOS `sed`** — On Linux, the `sed -i ''` syntax fails with `sed: invalid option -- ''`. Fix: replace all `sed -i ''` with `sed -i` (3 occurrences on lines 6, 7, 53). The Python portions are platform-independent.
- **Sub-crate `frb_generated` conflicts** — Each submodule generates its own `frb_generated.rs`. When used as a bull_sdk dependency, the `bull_sdk` Cargo feature disables them. If you see duplicate trait errors, check that `#[cfg(not(feature = "bull_sdk"))]` is present in the sub-crate.
- **Mirror types require manual `From` impls** — FRB generates opaque types for external crate enums with data. You must manually implement `From` conversions in `simple.rs`. Without this, Dart receives unconvertible types.
- **`flutter_rust_bridge.yaml` `rust_input` must list all scanned APIs** — If you add a new sub-crate API module, add it to `rust_input` or FRB won't generate bindings for it.
- **Cargo workspace excludes submodules** — The root `Cargo.toml` only includes `packages/bull_sdk/rust`. Submodule Rust code is excluded to avoid duplicate symbols. Do not add submodule paths to workspace members.

## References

- `references/troubleshooting.md` — Common FRB errors and fixes
