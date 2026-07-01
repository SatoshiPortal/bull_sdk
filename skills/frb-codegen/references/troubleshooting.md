# FRB Codegen Troubleshooting

Common errors when working with flutter_rust_bridge in bull_sdk and how to fix them.

## Error: "the trait bound `XxxError: FrbWrapper` is not satisfied"

**Cause:** `fix_frb_generated.sh` was not run after codegen, or the error type pattern changed.

**Fix:** Re-run `bash fix_frb_generated.sh`. If the error type name changed in the sub-crate, update the `sed` patterns in the script to match the new name.

## Error: "duplicate definitions of trait `Xxx`"

**Cause:** A sub-crate's `frb_generated.rs` is not cfg-gated properly.

**Fix:** Check that the sub-crate's `lib.rs` has:
```rust
#[cfg(not(feature = "bull_sdk"))]
mod frb_generated;
```
Also ensure the sub-crate's `Cargo.toml` defines the `bull_sdk` feature.

## Error: "no method named `into` found for struct `Xxx`"

**Cause:** Mirror type in `simple.rs` is missing `From` implementation.

**Fix:** Add bidirectional `From` impls in `packages/bull_sdk/rust/src/api/simple.rs`. See existing `TxFee` and `ArkTransaction` examples.

## Error: "unresolved import `crate::api::simple::Xxx`"

**Cause:** New mirror type not declared in `api/mod.rs`.

**Fix:** Ensure `packages/bull_sdk/rust/src/api/mod.rs` contains:
```rust
pub mod simple;
```

## Error: FRB codegen not picking up new API

**Cause:** New Rust module not listed in `flutter_rust_bridge.yaml` `rust_input`.

**Fix:** Add the module path to `rust_input` in `packages/bull_sdk/flutter_rust_bridge.yaml`:
```yaml
rust_input: crate::api, ark_wallet::ark, bbqr, dart_bbqr::api, boltz::api, lwk::api, new_crate::api
```

## Error: "sed: invalid option -- ''" on Linux

**Cause:** `fix_frb_generated.sh` uses macOS `sed -i ''` syntax. Linux sed does not accept the empty string argument.

**Fix:** Replace all 3 occurrences of `sed -i ''` with `sed -i` in the script:
- Line 6: `sed -i 's/transform_result_dco::<_, _, lwk::api::error::LwkError>/...`
- Line 7: `sed -i 's/transform_result_dco::<_, _, boltz::api::error::BoltzError>/...`
- Line 53: `sed -i 's/api_miner_fee,/api_miner_fee.into(),/g'`

## Error: Submodule Rust code not compiling

**Cause:** Submodule branches may have diverged from what bull_sdk expects.

**Fix:** Check `.gitmodules` for expected branches. Run:
```bash
cd packages/<submodule>
git fetch origin
git checkout <expected-branch>
```
Then re-run `cargo check -p rust_lib_bull_sdk`.
