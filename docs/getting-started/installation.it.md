# Installazione

## Prerequisiti

| Strumento | Versione | Note |
|-----------|----------|------|
| Flutter | 3.44.2 | Gestito tramite [FVM](https://fvm.app/) |
| Dart | 3.12.2 | Incluso con Flutter 3.44.2 |
| Rust | 1.95.0 | Fissato in `rust-toolchain.toml` |
| Git | 2.x | Per inizializzare i submodules |

## 1. Clona e Inizializza i Submodules

```bash
git clone https://github.com/SatoshiPortal/bull_sdk.git
cd bull_sdk
git submodule update --init --recursive
```

!!! warning "URL SSH"
    `.gitmodules` usa URL SSH (`git@github.com:`). Nei container o CI senza chiavi SSH, convertire prima in HTTPS:
    ```bash
    sed -i 's|git@github.com:|https://github.com/|' .gitmodules
    git submodule sync
    git submodule update --init --recursive
    ```

## 2. Installa Flutter tramite FVM

```bash
# Installa FVM
dart pub global activate fvm

# Installa e usa Flutter 3.44.2
fvm install 3.44.2
fvm use 3.44.2
```

## 3. Installa Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
rustup install 1.95.0
rustup default 1.95.0
```

## 4. Installa le Dipendenze

```bash
# Dipendenze Dart/Flutter
fvm flutter pub get

# Dipendenze Rust
cargo fetch
```

## 5. Dipendenze di Sistema (Linux)

```bash
sudo apt-get install -y \
  ninja-build build-essential gcc g++ cmake \
  libgtk-3-dev pkg-config libclang-dev
```

!!! info "Prossimo Passo"
    Una volta completata l'installazione, procedere con la guida [Quick Start](quickstart.md).
