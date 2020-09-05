#!/usr/bin/env bash

# Automate my docs :D
docker_make_chapter() {
    (
      cd ${HOME}/devel/raffaeldutra/docs
      make docker type=chapter
    )
}

# Apache benchmark. This function must receive a parameter
docker_ab() {
  [ -z "${1}" ] && { echo "Please enter an URL"; return; }

cat << EOT
Using the following command:
docker container run --rm raffaeldutra/apache-ab:latest -k -c 100 -n 10000 ${1}/

WARNING: This function uses the latest version for this image
Wanna overwrite parameters? You can use the command: docker container run --rm raffaeldutra/apache-ab
EOT

  docker container run --rm raffaeldutra/apache-ab:latest -k -c 100 -n 10000 ${1}/
}
