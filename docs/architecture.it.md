# Architettura

## Come Funziona

Bull SDK è un singolo pacchetto `flutter_rust_bridge` (FRB) che genera binding Dart unificati scansionando le API Rust di ogni sub-crate come dipendenze esterne.

```
┌─────────────────────────────────────────────┐
│              bull_sdk (Dart)                │
│  lib/ark.dart  lib/boltz.dart  lib/lwk.dart│
├─────────────────────────────────────────────┤
│        frb_generated.rs (unificato)         │
│      Singolo dispatcher FFI per tutto FFI   │
├─────────────────────────────────────────────┤
│  ark_wallet │ bbqr │ boltz │ lwk │ bitbox  │
│    (Crate Rust esterni via deps Cargo)      │
└─────────────────────────────────────────────┘
```

## Decisioni Architetturali Chiave

### Libreria Nativa Unica

Tutto il codice Rust viene compilato in un singolo `.so` / `.dylib`. Questo elimina:
- Compilazione duplicata di dipendenze condivise (bitcoin, secp256k1, tokio, openssl)
- Caricamento di più librerie native a runtime
- Moltiplicazione delle compilazioni multi-architettura su Android

### FRB dei sub-crate con cfg-gate

Ogni submodule ha il proprio `frb_generated.rs`. Quando usato come dipendenza di `bull_sdk`, questi vengono disabilitati tramite:

```rust
#[cfg(not(feature = "bull_sdk"))]
mod frb_generated;
```

Bull SDK fornisce il proprio `frb_generated.rs` unificato.

### Tipi Specchio per Enum con Dati

Gli enum Rust con dati (come `TxFee`, `ArkTransaction`) diventano opachi quando scansionati come tipi di crate esterni. FRB non può generare automaticamente le classi Dart adeguate.

Soluzione: tipi specchio manuali in `packages/bull_sdk/rust/src/api/simple.rs`:

```rust
#[flutter_rust_bridge::frb(mirror(boltz::api::fees::TxFee))]
pub enum TxFee {
    Absolute(u64),
    Relative(f64),
}
```

### Script di Post-Processing

Dopo il codegen FRB, `fix_frb_generated.sh` modifica il codice Rust generato per:
- Avvolgere i tipi errore dei crate esterni in `FrbWrapper`
- Aggiungere `.map_err(FrbWrapper)` ai risultati delle closure
- Convertire i tipi specchio tramite `.into()`

Questo è obbligatorio — senza, la compilazione fallisce con ~86 errori di tipo.

## Grafo delle Dipendenze

```
bull_sdk (pacchetto principale)
├── ark_wallet (git submodule, feature: bull_sdk)
├── bbqr (git submodule)
├── dart_bbqr (git submodule, feature: bull_sdk)
├── boltz (git submodule, feature: bull_sdk)
├── lwk (git submodule, feature: bull_sdk)
└── bitbox (git submodule, feature: bull_sdk)

boltz-stream (puro Dart, dipende da bull_sdk)
satoshifier (git submodule, dipende da bull_sdk + bdk_dart)
```
