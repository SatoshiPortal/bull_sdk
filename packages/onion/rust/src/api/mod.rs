//! Public surface of `onion`.
//!
//! Phase 1 is plain Rust: no `flutter_rust_bridge` annotations yet, so the
//! whole thing is testable with `cargo test` and carries no binding-layer
//! risk. Phase 2 adds `#[frb]` on top of these same types.
//!
//! Nothing from `arti_client` crosses this boundary. Every type here is ours,
//! which is what lets the Dart side switch exhaustively and keeps an upstream
//! API change from rippling into the app.

#![deny(unsafe_code)]

pub mod client;
pub mod error;
pub mod status;

mod socks;

pub use client::TorService;
pub use error::{TorFailure, TorFailureKind, TorResult};
pub use status::{Blockage, BlockageKind, TorStatus};
