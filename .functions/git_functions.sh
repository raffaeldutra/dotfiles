#!/usr/bin/env bash

# If you did something wrong, a.k.a commited using wrong email/credential
git_change_commiter() {
    echo "git commit --amend --author='Rafael Dutra <raffaeldutra@gmail.com>'"
}

# Show on terminal my personal credentials for git
git_personal_config() {
cat << EOT
git config user.email "raffaeldutra@gmail.com"
git config user.name "Rafael Dutra"
EOT
}

# Show general credential for git
git_general_config() {
cat << EOT
git config user.email ""
git config user.name ""
EOT
}
