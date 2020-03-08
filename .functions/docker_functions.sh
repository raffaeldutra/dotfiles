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

  docker container run --rm jordi/ab -k -c 100 -n 10000 ${1}
}
