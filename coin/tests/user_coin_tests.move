#[test_only]
module coin_address::user_coin_tests {
    use aptos_framework::account;
    use aptos_framework::coin;

    use coin_address::user_coin::{Self, USER_COIN};

    #[test(coin_admin = @coin_address)]
    fun test_mint_coins_to_account(coin_admin: signer) {
        user_coin::initialize(&coin_admin);

        let user_addr = @0x41;
        let user = account::create_account_for_test(user_addr);
        coin::register<USER_COIN>(&user);
        user_coin::mint(&coin_admin, user_addr, 100);

        assert!(coin::balance<USER_COIN>(user_addr) == 100, 1);
    }
}
