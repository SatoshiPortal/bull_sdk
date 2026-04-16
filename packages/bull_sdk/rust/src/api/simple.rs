// Mirror types that FRB would otherwise generate as opaque
// when scanning external crate dependencies

#[flutter_rust_bridge::frb(mirror(boltz::api::types::TxFee))]
pub enum TxFee {
    Absolute(u64),
    Relative(f64),
}

impl From<TxFee> for boltz::api::types::TxFee {
    fn from(val: TxFee) -> boltz::api::types::TxFee {
        match val {
            TxFee::Absolute(v) => boltz::api::types::TxFee::Absolute(v),
            TxFee::Relative(v) => boltz::api::types::TxFee::Relative(v),
        }
    }
}
