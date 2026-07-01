# Arquitetura

## Como Funciona

Bull SDK é um pacote único `flutter_rust_bridge` (FRB) que gera bindings Dart unificados escaneando a API Rust de cada sub-crate como dependências externas.

```
┌─────────────────────────────────────────────┐
│              bull_sdk (Dart)                │
│  lib/ark.dart  lib/boltz.dart  lib/lwk.dart│
├─────────────────────────────────────────────┤
│         frb_generated.rs (unificado)        │
│      Único despachante FFI para todo FFI    │
├─────────────────────────────────────────────┤
│  ark_wallet │ bbqr │ boltz │ lwk │ bitbox  │
│    (Crates Rust externos via deps Cargo)    │
└─────────────────────────────────────────────┘
```

## Decisões de Design Chave

### Biblioteca Nativa Única

Todo o código Rust é compilado em um único `.so` / `.dylib`. Isso elimina:
- Compilação duplicada de dependências compartilhadas (bitcoin, secp256k1, tokio, openssl)
- Carregamento de múltiplas bibliotecas nativas em runtime
- Multiplicação de compilação multi-arquitetura no Android

### FRB dos sub-crates com cfg-gate

Cada submodule tem seu próprio `frb_generated.rs`. Quando usado como dependência de `bull_sdk`, estes são desabilitados via:

```rust
#[cfg(not(feature = "bull_sdk"))]
mod frb_generated;
```

Bull SDK fornece seu próprio `frb_generated.rs` unificado.

### Tipos Espelho para Enums com Dados

Os enums Rust com dados (como `TxFee`, `ArkTransaction`) tornam-se opacos quando escaneados como tipos de crates externos. FRB não pode gerar automaticamente as classes Dart adequadas.

Solução: tipos espelho manuais em `packages/bull_sdk/rust/src/api/simple.rs`:

```rust
#[flutter_rust_bridge::frb(mirror(boltz::api::fees::TxFee))]
pub enum TxFee {
    Absolute(u64),
    Relative(f64),
}
```

### Script de Pós-Processamento

Após o codegen FRB, `fix_frb_generated.sh` modifica o código Rust gerado para:
- Envelopar os tipos de erro dos crates externos em `FrbWrapper`
- Adicionar `.map_err(FrbWrapper)` aos resultados das closures
- Converter os tipos espelho via `.into()`

Isso é obrigatório — sem isso, a compilação falha com ~86 erros de tipo.

## Grafo de Dependências

```
bull_sdk (pacote principal)
├── ark_wallet (git submodule, feature: bull_sdk)
├── bbqr (git submodule)
├── dart_bbqr (git submodule, feature: bull_sdk)
├── boltz (git submodule, feature: bull_sdk)
├── lwk (git submodule, feature: bull_sdk)
└── bitbox (git submodule, feature: bull_sdk)

boltz-stream (puro Dart, depende de bull_sdk)
satoshifier (git submodule, depende de bull_sdk + bdk_dart)
```
