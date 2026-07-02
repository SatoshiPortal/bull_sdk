// Mirror types that FRB would otherwise generate as opaque
// when scanning external crate dependencies

#[flutter_rust_bridge::frb(mirror(ark_wallet::ark::transactions::ArkTransaction))]
pub enum ArkTransaction {
    Boarding {
        txid: String,
        sats: i64,
        confirmed_at: Option<i64>,
    },
    Commitment {
        txid: String,
        sats: i64,
        created_at: i64,
    },
    Redeem {
        txid: String,
        sats: i64,
        is_settled: bool,
        created_at: i64,
    },
}

impl From<ark_wallet::ark::transactions::ArkTransaction> for ArkTransaction {
    fn from(val: ark_wallet::ark::transactions::ArkTransaction) -> ArkTransaction {
        match val {
            ark_wallet::ark::transactions::ArkTransaction::Boarding { txid, sats, confirmed_at } => {
                ArkTransaction::Boarding { txid, sats, confirmed_at }
            }
            ark_wallet::ark::transactions::ArkTransaction::Commitment { txid, sats, created_at } => {
                ArkTransaction::Commitment { txid, sats, created_at }
            }
            ark_wallet::ark::transactions::ArkTransaction::Redeem { txid, sats, is_settled, created_at } => {
                ArkTransaction::Redeem { txid, sats, is_settled, created_at }
            }
        }
    }
}

impl From<ArkTransaction> for ark_wallet::ark::transactions::ArkTransaction {
    fn from(val: ArkTransaction) -> ark_wallet::ark::transactions::ArkTransaction {
        match val {
            ArkTransaction::Boarding { txid, sats, confirmed_at } => {
                ark_wallet::ark::transactions::ArkTransaction::Boarding { txid, sats, confirmed_at }
            }
            ArkTransaction::Commitment { txid, sats, created_at } => {
                ark_wallet::ark::transactions::ArkTransaction::Commitment { txid, sats, created_at }
            }
            ArkTransaction::Redeem { txid, sats, is_settled, created_at } => {
                ark_wallet::ark::transactions::ArkTransaction::Redeem { txid, sats, is_settled, created_at }
            }
        }
    }
}
