#[test_only]
module {{ package_lowercase_name }}::{{ package_lowercase_name }}_tests {
    #[test]
    fun test_e2e() {
        assert!(true, 1);
    }
}
