# FRB Codegen

Working with flutter_rust_bridge code generation in Bull SDK.

---

## When to Regenerate

Regenerate bindings when:

- Modifying Rust API code in any sub-crate
- Updating `flutter_rust_bridge.yaml` inputs
- Adding new mirror types for data-variant enums
- Upgrading flutter_rust_bridge version

## Codegen Workflow

### 1. Run FRB Codegen

```bash
cd packages/bull_sdk
flutter_rust_bridge_codegen generate
```

This reads `flutter_rust_bridge.yaml` and generates:
- `lib/src/rust/frb_generated.dart` — Dart bindings
- `rust/src/frb_generated.rs` — Rust FFI dispatcher

### 2. Run Post-Processing (MANDATORY)

```bash
cd packages/bull_sdk
bash fix_frb_generated.sh
```

This patches `rust/src/frb_generated.rs` to:
- Wrap external crate error types (`LwkError`, `BoltzError`) in `FrbWrapper`
- Add `.map_err(FrbWrapper)` to closure results
- Convert mirrored `TxFee` via `.into()`
- Convert `Vec<ArkTransaction>` via iterator mapping

!!! danger "Never skip this step"
    Without `fix_frb_generated.sh`, the build fails with ~86 type errors.

### 3. Validate

```bash
cargo check -p rust_lib_bull_sdk
```

Should complete with zero errors.

## Configuration

The codegen is configured in `flutter_rust_bridge.yaml`:

```yaml
rust_input: crate::api, ark_wallet::ark, bbqr, dart_bbqr::api, boltz::api, lwk::api
rust_root: rust/
dart_output: lib/src/rust
dart_entrypoint_class_name: BullSdk
enable_lifetime: true
full_dep: true
dart3: true
web: false
```

### Key Settings

| Setting | Value | Meaning |
|---------|-------|---------|
| `rust_input` | Multiple crates | Scans all sub-crate APIs |
| `dart_entrypoint_class_name` | `BullSdk` | Main init class |
| `web` | `false` | No WASM — Dart-only on web |

## Adding New Mirror Types

When a sub-crate exposes a data-variant enum, create a mirror in `packages/bull_sdk/rust/src/api/simple.rs`:

```rust
#[flutter_rust_bridge::frb(mirror(sub_crate::path::MyEnum))]
pub enum MyEnum {
    Variant1(u64),
    Variant2 { field: String },
}

impl From<MyEnum> for sub_crate::path::MyEnum { /* ... */ }
impl From<sub_crate::path::MyEnum> for MyEnum { /* ... */ }
```

Then re-run steps 1-3.

## Platform Notes

- **macOS**: `fix_frb_generated.sh` works as-is
- **Linux**: Patch `sed -i ''` to `sed -i` before running (3 occurrences)
- **Windows**: Use WSL or Git Bash
