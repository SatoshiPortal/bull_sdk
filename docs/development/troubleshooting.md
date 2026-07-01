# Troubleshooting

Common errors and fixes when working with Bull SDK.

---

## Build Errors

### 86 type errors after FRB codegen

**Symptom:**
```
error[E0433]: cannot find type `TxFee` in module `super`
error[E0308]: mismatched types ...
```

**Cause:** `fix_frb_generated.sh` was not run after codegen.

**Fix:**
```bash
cd packages/bull_sdk
bash fix_frb_generated.sh
cargo check -p rust_lib_bull_sdk
```

---

### "sed: invalid option -- ''" on Linux

**Symptom:**
```
sed: invalid option -- ''
```

**Cause:** `fix_frb_generated.sh` uses macOS `sed -i ''` syntax.

**Fix:** Replace all `sed -i ''` with `sed -i` in the script (lines 6, 7, 53).

---

### Duplicate trait definitions

**Symptom:**
```
error[E0119]: conflicting implementations of trait
```

**Cause:** A sub-crate's `frb_generated.rs` is not cfg-gated.

**Fix:** Check that the sub-crate's `lib.rs` has:
```rust
#[cfg(not(feature = "bull_sdk"))]
mod frb_generated;
```

---

### Unresolved import for mirror type

**Symptom:**
```
error[E0432]: unresolved import `crate::api::simple::MyEnum`
```

**Cause:** New mirror type not visible in the module tree.

**Fix:** Ensure `packages/bull_sdk/rust/src/api/mod.rs` exports it:
```rust
pub mod simple;
```

---

## Submodule Errors

### Empty submodule directories

**Symptom:** `packages/ark-wallet/` exists but is empty.

**Fix:**
```bash
git submodule update --init --recursive
```

---

### SSH connection refused

**Symptom:**
```
git@github.com: Permission denied (publickey).
```

**Cause:** `.gitmodules` uses SSH URLs but no SSH keys are configured.

**Fix:**
```bash
sed -i 's|git@github.com:|https://github.com/|' .gitmodules
git submodule sync
git submodule update --init --recursive
```

---

## Flutter Errors

### Version mismatch

**Symptom:**
```
The current Dart SDK version is X.Y.Z
The current Flutter SDK version is A.B.C
```

**Fix:** Use FVM to ensure correct versions:
```bash
fvm use 3.44.2
fvm flutter pub get
```

---

### "web: false" — no Rust on web

This is by design. The `flutter_rust_bridge.yaml` has `web: false`, so Flutter web builds are Dart-only. Rust APIs are unavailable in web builds.

For full Rust access, use Linux, Android, iOS, macOS, or Windows.

---

## Getting Help

- Check the [FRB Codegen](frb-codegen.md) guide
- Review [Architecture](../architecture.md) for design context
- Open an issue on [GitHub](https://github.com/SatoshiPortal/bull_sdk/issues)
