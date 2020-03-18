# Functions list for Vault

First, you MUST have a .env.sh file at your $HOME directory, otherwise it will not works. The `.env.sh` file expect on this release 2 variables.

1 - LDAP_USERNAME: for now this script only suports ldap auth method.

2 - VAULT_ADDR: which address you want to connect.

```vault_address()```

This function will call the `vault_address` function above to invoke ldap authentication.

```vault_login()```