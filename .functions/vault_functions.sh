vault_address() {
    if [ ! -e ~/dotfiles/.env.sh ]; then
        echo "~/dotfiles/.env.sh not found"

        exit 1
    fi

    source ~/dotfiles/.env.sh ${1}
}

vault_login() {
    if [ "x" = "x${1}" ]; then
        echo "First parameter must be an environment <prd/uat/dev>"

        return 1
    fi

    vault_address ${1}

    vault login -method=ldap username="${LDAP_USERNAME}"
    echo "Connecting in: ${VAULT_ADDR}"
}
