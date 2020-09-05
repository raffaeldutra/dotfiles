FROM ubuntu:20.04

LABEL maintainer="Rafael Dutra"

# 2>/dev/null to prevent WARNING on console
RUN apt update 2>/dev/null && \
  apt install 2>/dev/null \
  build-essential \
  git \
  source \
  --yes

CMD ["/bin/bash"]