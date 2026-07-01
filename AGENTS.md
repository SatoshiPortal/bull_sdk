# Bull SDK

Unified flutter_rust_bridge bindings for Bitcoin and Liquid wallet operations. Merges Ark, BBQr, Boltz, LWK, and Bitbox into a single native library.

## Setup Commands

```bash
# Initialize git submodules (required — packages are submodules)
git submodule update --init --recursive

# Install Flutter dependencies (FVM manages Flutter version)
fvm flutter pub get

# Install Rust dependencies
cargo fetch
```

## Build Commands

```bash
# Build the unified native library (Rust + Dart bindings)
cd packages/bull_sdk
flutter_rust_bridge_codegen generate
bash fix_frb_generated.sh
cargo check -p rust_lib_bull_sdk
```

## Test Commands

```bash
# Run integration tests (requires device/emulator)
cd packages/bull_sdk
flutter test integration_test/

# Run satoshifier unit tests
cd packages/satoshifier
flutter test test/

# Run satoshifier integration tests
cd packages/satoshifier/example
flutter test integration_test/

# Lint
cd packages/bull_sdk
flutter analyze

# Documentation (MkDocs)
mkdocs serve              # Dev server at localhost:8001
mkdocs build              # Build static site to site/
```

## Project Structure

```
bull-sdk/
├── Cargo.toml                          # Cargo workspace (Rust)
├── pubspec.yaml                        # Dart workspace root
├── packages/
│   ├── bull_sdk/                       # Unified FRB package (single native library)
│   │   ├── flutter_rust_bridge.yaml    # FRB codegen config — scans all sub-crate APIs
│   │   ├── fix_frb_generated.sh        # Post-codegen patches (MANDATORY)
│   │   ├── rust/                       # Bridge crate (rust_lib_bull_sdk)
│   │   ├── lib/                        # Dart exports: ark.dart, bbqr.dart, boltz.dart, lwk.dart, bitbox.dart
│   │   ├── integration_test/           # Integration tests
│   │   └── rust_builder/              # Native build tooling (cargokit)
│   ├── ark-wallet/                     # git submodule → SatoshiPortal/ark-wallet-dart
│   ├── bbqr/                           # git submodule → SatoshiPortal/bbqr-dart
│   ├── boltz/                          # git submodule → SatoshiPortal/boltz-dart
│   ├── lwk/                            # git submodule → SatoshiPortal/lwk-dart
│   ├── bitbox/                         # git submodule → SatoshiPortal/bitbox-dart
│   ├── boltz-stream/                   # Pure Dart — BoltzWebSocket (depends on bull_sdk)
│   ├── satoshifier/                    # git submodule → SatoshiPortal/dart-satoshifier
│   └── bitbox-transport/               # Transport layer for Bitbox hardware
```

## Architecture

`bull_sdk` is a single flutter_rust_bridge package that generates unified Dart bindings by scanning the Rust API of each sub-crate as external dependencies:

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

- **One native library** — all Rust code compiles into a single `.so`/`.dylib`
- **Sub-crate `frb_generated` is cfg-gated** — when used as a dependency of `bull_sdk`, each sub-crate's `frb_generated.rs` is disabled via `#[cfg(not(feature = "bull_sdk"))]`
- **Mirror types** — Rust enums with data (like `TxFee`, `ArkTransaction`) use `#[frb(mirror)]` to generate proper sealed Dart classes

## Key Configuration

| Item | Value | Notes |
|------|-------|-------|
| Rust toolchain | `1.95.0` | Pinned in `rust-toolchain.toml` |
| Flutter version | `3.44.2` | Pinned via FVM in `.fvmrc` |
| Dart SDK | `>=3.1.0` | bull_sdk; `>=3.12.2` for satoshifier/boltz-stream |
| flutter_rust_bridge | `2.12.0` | Exact version pinned in pubspec and Cargo.toml |
| Cargo profile release | `opt-level = "z"`, `lto = true`, `panic = "abort"` | Aggressive size optimization |

## Skills Reference

| Skill | Trigger | Covers |
|-------|---------|--------|
| [frb-codegen](skills/frb-codegen/SKILL.md) | FRB codegen, regenerate bindings, fix_frb_generated | Full FRB codegen + post-processing workflow |

## Docs Reference

| Page | URL | Content |
|------|-----|---------|
| Home | `localhost:8001` | Overview, modules, quick start |
| API Reference | `localhost:8001/api-reference/` | Boltz, LWK, Ark, BBQr, Bitbox |
| Architecture | `localhost:8001/architecture/` | Design decisions, dependency graph |
| Troubleshooting | `localhost:8001/development/troubleshooting/` | Common errors and fixes |
| robots.txt | `localhost:8001/robots.txt` | Agent-aware crawl directives |
| llms.txt | `localhost:8001/llms.txt` | Service description for LLMs |

## Gotchas

- **Submodules must be initialized** — `git submodule update --init --recursive` is required before anything builds. Without it, Rust deps and Dart packages are missing.
- **Submodule URLs use SSH** — `.gitmodules` uses `git@github.com:` URLs. In containers or CI without SSH keys, convert to HTTPS: `sed -i 's|git@github.com:|https://github.com/|' .gitmodules && git submodule sync && git submodule update --init --recursive`
- **Always run `fix_frb_generated.sh` after FRB codegen** — FRB cannot automatically handle external crate error types or mirrored enum conversions. Without this step, the build will fail with type mismatch errors.
- **Sub-crate `frb_generated` conflicts** — Each submodule has its own `frb_generated.rs`. When used as a `bull_sdk` dependency, the `bull_sdk` feature gate disables them. Never commit sub-crate FRB output into bull_sdk.
- **Mirror types are manual** — Data-variant Rust enums scanned as external crate types become opaque. You must create mirror types in `packages/bull_sdk/rust/src/api/simple.rs` and implement `From` conversions.
- **`fix_frb_generated.sh` uses macOS `sed`** — The script uses `sed -i ''` which is macOS-specific. On Linux, use `sed -i` (no empty string argument). Patch before running.
- **Cargo workspace excludes submodules** — The root `Cargo.toml` workspace only includes `packages/bull_sdk/rust`. Submodule Rust code is excluded from the workspace to avoid duplicate symbol errors.

## Git Conventions

- Commit format: conventional commits (`type: description`)
- Submodule branches tracked in `.gitmodules` — changes to submodule refs require coordinated updates
