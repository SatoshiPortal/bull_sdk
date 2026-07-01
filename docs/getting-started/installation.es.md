# Instalación

## Prerrequisitos

| Herramienta | Versión | Notas |
|-------------|---------|-------|
| Flutter | 3.44.2 | Administrado via [FVM](https://fvm.app/) |
| Dart | 3.12.2 | Incluido con Flutter 3.44.2 |
| Rust | 1.95.0 | Fijado en `rust-toolchain.toml` |
| Git | 2.x | Para inicializar submodules |

## 1. Clonar e Inicializar Submodules

```bash
git clone https://github.com/SatoshiPortal/bull_sdk.git
cd bull_sdk
git submodule update --init --recursive
```

!!! warning "URLs SSH"
    `.gitmodules` usa URLs SSH (`git@github.com:`). En contenedores o CI sin claves SSH, convertir a HTTPS primero:
    ```bash
    sed -i 's|git@github.com:|https://github.com/|' .gitmodules
    git submodule sync
    git submodule update --init --recursive
    ```

## 2. Instalar Flutter via FVM

```bash
# Instalar FVM
dart pub global activate fvm

# Instalar y usar Flutter 3.44.2
fvm install 3.44.2
fvm use 3.44.2
```

## 3. Instalar Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
rustup install 1.95.0
rustup default 1.95.0
```

## 4. Instalar Dependencias

```bash
# Dependencias Dart/Flutter
fvm flutter pub get

# Dependencias Rust
cargo fetch
```

## 5. Dependencias del Sistema (Linux)

```bash
sudo apt-get install -y \
  ninja-build build-essential gcc g++ cmake \
  libgtk-3-dev pkg-config libclang-dev
```

!!! info "Siguiente Paso"
    Una vez completada la instalación, ir a la guía de [Inicio Rápido](quickstart.md).
