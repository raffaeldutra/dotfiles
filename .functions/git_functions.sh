#!/usr/bin/env bash

git_change_commiter() {
    echo "git commit --amend --author='Rafael Dutra <raffaeldutra@gmail.com>'"
}

git_personal_config() {
cat << EOT
git config user.email "raffaeldutra@gmail.com"
git config user.name "Rafael Dutra"
EOT
}

git_general_config() {
cat << EOT
git config user.email ""
git config user.name ""
EOT
}