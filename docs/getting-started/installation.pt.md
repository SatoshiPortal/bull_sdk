# Instalação

## Pré-requisitos

| Ferramenta | Versão | Notas |
|------------|--------|-------|
| Flutter | 3.44.2 | Gerenciado via [FVM](https://fvm.app/) |
| Dart | 3.12.2 | Incluído com Flutter 3.44.2 |
| Rust | 1.95.0 | Fixado em `rust-toolchain.toml` |
| Git | 2.x | Para inicializar submodules |

## 1. Clonar e Inicializar Submodules

```bash
git clone https://github.com/SatoshiPortal/bull_sdk.git
cd bull_sdk
git submodule update --init --recursive
```

!!! warning "URLs SSH"
    `.gitmodules` usa URLs SSH (`git@github.com:`). Em containers ou CI sem chaves SSH, converter para HTTPS primeiro:
    ```bash
    sed -i 's|git@github.com:|https://github.com/|' .gitmodules
    git submodule sync
    git submodule update --init --recursive
    ```

## 2. Instalar Flutter via FVM

```bash
# Instalar FVM
dart pub global activate fvm

# Instalar e usar Flutter 3.44.2
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

## 4. Instalar Dependências

```bash
# Dependências Dart/Flutter
fvm flutter pub get

# Dependências Rust
cargo fetch
```

## 5. Dependências do Sistema (Linux)

```bash
sudo apt-get install -y \
  ninja-build build-essential gcc g++ cmake \
  libgtk-3-dev pkg-config libclang-dev
```

!!! info "Próximo Passo"
    Uma vez concluída a instalação, ir para o guia de [Início Rápido](quickstart.md).
