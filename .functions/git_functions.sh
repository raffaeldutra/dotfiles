#!/usr/bin/env bash

git_change_commiter() {
cat << EOT
git commit --amend --author="Rafael Dutra <raffaeldutra@gmail.com>"
EOT
}

git_personal_config() {
cat << EOT
git config user.email "raffaeldutra@gmail.com"
git config user.name "Rafael Dutra"
EOT
}
