#!/usr/bin/env bash

function help() {
    cat << EOT
   create: creates structure for a new Terraform Module
EOT
}

declare moduleName="${2}"
declare pathModule="${HOME}/terraform/tf-modules/${moduleName}"

function validate() {
    if [ -z "${moduleName}" ]; then
        echo "You need to pass a folder"
    
        exit 1
    fi
}

function createModuleStructure() {
    if [ -e ${pathModule} ]; then
        echo "Folder already exists"
        exit 1
    fi

    echo "Creating directory: ${pathModule}"
    mkdir -p ${pathModule}
}

function createFilesStructure() {
    echo "Creating files at: ${pathModule}"

    > ${pathModule}/README.md
    > ${pathModule}/main.tf
    > ${pathModule}/outputs.tf
    > ${pathModule}/variables.tf
}

case "${1}" in
    create)
        validate "${2}"
        createModuleStructure
        createFilesStructure
    ;;
    *)
        help
    ;;
esac
