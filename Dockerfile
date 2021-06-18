FROM golang

RUN \
  apt update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
      libmpv-dev \
      python-pip \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  pip install --no-cache youtube-dl \
  && youtube-dl --version

RUN go get -v github.com/aykevl/plaincast

ENTRYPOINT [ "plaincast" ]
