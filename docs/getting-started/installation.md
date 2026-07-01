# Installation

## Prerequisites

| Tool | Version | Notes |
|------|---------|-------|
| Flutter | 3.44.2 | Managed via [FVM](https://fvm.app/) |
| Dart | 3.12.2 | Bundled with Flutter 3.44.2 |
| Rust | 1.95.0 | Pinned in `rust-toolchain.toml` |
| Git | 2.x | For submodule initialization |

## 1. Clone and Initialize Submodules

```bash
git clone https://github.com/SatoshiPortal/bull_sdk.git
cd bull_sdk
git submodule update --init --recursive
```

!!! warning "SSH URLs"
    `.gitmodules` uses SSH URLs (`git@github.com:`). In containers or CI without SSH keys, convert to HTTPS first:
    ```bash
    sed -i 's|git@github.com:|https://github.com/|' .gitmodules
    git submodule sync
    git submodule update --init --recursive
    ```

## 2. Install Flutter via FVM

```bash
# Install FVM
dart pub global activate fvm

# Install and use Flutter 3.44.2
fvm install 3.44.2
fvm use 3.44.2
```

## 3. Install Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
rustup install 1.95.0
rustup default 1.95.0
```

## 4. Install Dependencies

```bash
# Dart/Flutter dependencies
fvm flutter pub get

# Rust dependencies
cargo fetch
```

## 5. System Dependencies (Linux)

```bash
sudo apt-get install -y \
  ninja-build build-essential gcc g++ cmake \
  libgtk-3-dev pkg-config libclang-dev
```

!!! info "Next Step"
    Once installation is complete, head to the [Quick Start](quickstart.md) guide.
