#!/usr/bin/env bash

function help() {
    cat << EOT
   create: creates structure for a new Terraform provider
providers: list all providers supported
EOT
}

declare providerName="${2}"
declare pathModule="${HOME}/terraform/providers/${providerName}"

function providers() {
    cat << EOT
   aws
google
EOT
}

function validate() {
    if [ -z "${providerName}" ]; then
        echo "You need to pass a folder"
    
        exit 1
    fi
}

function createProvider() {
    declare pathProvider="${HOME}/providers/${provider}"

    case "${3}" in
        google)
            cp -av providers/google
    esac
}

case "${1}" in
    create)
        createProvider "${2}"
    ;;
    *)
        help
    ;;
esac
