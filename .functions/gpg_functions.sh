#!/usr/bin/env bash

gpg_generate_key() {
cat << EOT | gpg --batch --gen-key
    Key-Type: 1
    Key-Length: 4096
    Subkey-Type: 1
    Subkey-Length: 4096
    Name-Real: Rafael Dutra
    Name-Email: raffaeldutra@gmail.com
    Expire-Date: 0
EOT

gpg --armor --export $(gpg --list-secret-keys --keyid-format LONG raffaeldutra@gmail.com | cut -d " " -f3)
}


gpg_list_keys() {
    gpg --list-keys
}


gpg_delete_key_by_id () {
    gpg --delete-secret-keys "${1}"
    gpg --delete-key "${1}"
}
