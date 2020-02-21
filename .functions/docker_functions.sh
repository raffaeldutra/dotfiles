#!/usr/bin/env bash

docker_make_chapter() {
    (
      cd ${HOME}/devel/raffaeldutra/docs
      make docker type=chapter
    )
}

docker_ab() {
  docker container run --rm jordi/ab -k -c 100 -n 10000 http://${1}/
}