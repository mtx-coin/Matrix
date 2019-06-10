FROM debian:stretch
LABEL maintainer="MATRIX Developers <dev@matrix.org>"
LABEL description="Dockerised MATRIXCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
