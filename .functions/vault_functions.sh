vault_address() {
    source ${HOME}/.env
    echo "Connecting in: ${address}"
}

vault_login() {
    vault_address ${1}
    vault login -method=ldap username="${LDAP_USERNAME}"
}
