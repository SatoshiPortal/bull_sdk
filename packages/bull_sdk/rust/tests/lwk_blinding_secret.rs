use lwk::api::descriptor::Descriptor;
use lwk::api::types::LiquidNetwork;
use lwk::api::wallet::Wallet;
use secp256k1_zkp::{PublicKey, Secp256k1, SecretKey};
use std::str::FromStr;

#[test]
fn lwk_address_blinding_secret_matches_address_and_index() {
    let mnemonic =
        "umbrella response wide outer mystery drastic crew festival poet coconut error act";
    let network = LiquidNetwork::Testnet;
    let descriptor = Descriptor::new_confidential(network, mnemonic.to_string()).unwrap();
    let dbpath = std::env::temp_dir().join(format!(
        "bull_sdk_lwk_address_blinding_secret_{}",
        std::process::id()
    ));
    let wallet = Wallet::init(network, dbpath.to_string_lossy().into_owned(), descriptor).unwrap();

    let first = wallet.address_with_blinding_secret(0).unwrap();
    let second = wallet.address_with_blinding_secret(1).unwrap();

    assert_eq!(first.blinding_secret.len(), 64);
    assert!(first
        .blinding_secret
        .bytes()
        .all(|byte| byte.is_ascii_hexdigit()));

    let secret = SecretKey::from_str(&first.blinding_secret).unwrap();
    let public = PublicKey::from_secret_key(&Secp256k1::new(), &secret).to_string();
    assert_eq!(first.address.blinding_key.as_deref(), Some(public.as_str()));

    assert_eq!(first.address.index, Some(0));
    assert_eq!(second.address.index, Some(1));
    assert_ne!(first.address.confidential, second.address.confidential);
    assert_ne!(first.blinding_secret, second.blinding_secret);

    drop(wallet);
    let _ = std::fs::remove_dir_all(dbpath);
}
