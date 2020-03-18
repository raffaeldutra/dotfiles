#!/usr/bin/env bash

. ${HOME}/dotfiles/.terminal_colors

# Which address should I connect?
# It uses .env.sh script to do the right VAULT_ADDR replacement.
vault_address() {
    if [ ! -e ${HOME}/dotfiles/.env.sh ]; then
        echo "${HOME}/dotfiles/.env.sh not found"

        exit 1
    fi

    source ${HOME}/dotfiles/.env.sh ${1}
}

# It accepts an environment to work with.
# Example: vault_login prod
# Example: vault_login dev
# This function will call another function called vault_address and replace the environment for the right VAULT_ADDR env variable.
# Check the .env.sh.example file.
#
# For now it only supports ldap authentication
vault_login() {
    if [ "x" = "x${1}" ]; then
        echo "First parameter must be an environment <prd/uat/dev>"

        return 1
    fi

    vault_address ${1}

    echo -n "Connecting in: "

    case "${1}" in
    'dev' | 'tst')
        echo -e "${green}${VAULT_ADDR}${off}"
        ;;
    'uat' | 'hom')
        echo -e "${yellow}${VAULT_ADDR}${off}"
        ;;
    'prd')
        echo -e "${red}${VAULT_ADDR}${off}"
        ;;
    *)
        echo -e "${cyan}environment ${red}${1}${off} ${cyan}not found${off}"

        return 1
        ;;
    esac

    vault login -method=ldap username="${LDAP_USERNAME}"
}
