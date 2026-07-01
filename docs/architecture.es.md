# Arquitectura

## Cómo Funciona

Bull SDK es un paquete único de `flutter_rust_bridge` (FRB) que genera bindings Dart unificados escaneando la API Rust de cada sub-crate como dependencias externas.

```
┌─────────────────────────────────────────────┐
│              bull_sdk (Dart)                │
│  lib/ark.dart  lib/boltz.dart  lib/lwk.dart│
├─────────────────────────────────────────────┤
│         frb_generated.rs (unificado)        │
│      Único despachador FFI para todo FFI    │
├─────────────────────────────────────────────┤
│  ark_wallet │ bbqr │ boltz │ lwk │ bitbox  │
│    (Crates Rust externos vía deps Cargo)    │
└─────────────────────────────────────────────┘
```

## Decisiones de Diseño Clave

### Biblioteca Nativa Única

Todo el código Rust se compila en un único `.so` / `.dylib`. Esto elimina:
- Compilación duplicada de dependencias compartidas (bitcoin, secp256k1, tokio, openssl)
- Carga de múltiples bibliotecas nativas en runtime
- Multiplicación de compilación multi-arquitectura en Android

### FRB de sub-crates con cfg-gate

Cada submodule tiene su propio `frb_generated.rs`. Cuando se usa como dependencia de `bull_sdk`, estos se deshabilitan via:

```rust
#[cfg(not(feature = "bull_sdk"))]
mod frb_generated;
```

Bull SDK provee su propio `frb_generated.rs` unificado.

### Tipos Espejo para Enums con Datos

Los enums Rust con datos (como `TxFee`, `ArkTransaction`) se vuelven opacos al escanearse como tipos de crates externos. FRB no puede generar automáticamente clases Dart adecuadas para ellos.

Solución: tipos espejo manuales en `packages/bull_sdk/rust/src/api/simple.rs`:

```rust
#[flutter_rust_bridge::frb(mirror(boltz::api::fees::TxFee))]
pub enum TxFee {
    Absolute(u64),
    Relative(f64),
}
```

### Script de Post-Procesamiento

Después del código FRB, `fix_frb_generated.sh` parchea el código Rust generado para:
- Envolver tipos de error de crates externos en `FrbWrapper`
- Agregar `.map_err(FrbWrapper)` a resultados de clausuras
- Convertir tipos espejo via `.into()`

Esto es obligatorio — sin esto, la compilación falla con ~86 errores de tipo.

## Gráfico de Dependencias

```
bull_sdk (paquete principal)
├── ark_wallet (git submodule, feature: bull_sdk)
├── bbqr (git submodule)
├── dart_bbqr (git submodule, feature: bull_sdk)
├── boltz (git submodule, feature: bull_sdk)
├── lwk (git submodule, feature: bull_sdk)
└── bitbox (git submodule, feature: bull_sdk)

boltz-stream (puro Dart, depende de bull_sdk)
satoshifier (git submodule, depende de bull_sdk + bdk_dart)
```
