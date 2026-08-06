// Mirror types that FRB would otherwise generate as opaque
// when scanning external crate dependencies

#[flutter_rust_bridge::frb(mirror(boltz::api::fees::TxFee))]
pub enum TxFee {
    Absolute(u64),
    Relative(f64),
}

impl From<TxFee> for boltz::api::fees::TxFee {
    fn from(val: TxFee) -> boltz::api::fees::TxFee {
        match val {
            TxFee::Absolute(v) => boltz::api::fees::TxFee::Absolute(v),
            TxFee::Relative(v) => boltz::api::fees::TxFee::Relative(v),
        }
    }
}
