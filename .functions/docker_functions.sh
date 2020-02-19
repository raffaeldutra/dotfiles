#!/usr/bin/env bash

docker_make_chapter() {
    (
      cd ${HOME}/devel/raffaeldutra/docs
      make docker type=chapter
    )
}
