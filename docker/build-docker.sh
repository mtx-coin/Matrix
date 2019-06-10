#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-matrixpay/matrixd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/matrixd docker/bin/
cp $BUILD_DIR/src/matrix-cli docker/bin/
cp $BUILD_DIR/src/matrix-tx docker/bin/
strip docker/bin/matrixd
strip docker/bin/matrix-cli
strip docker/bin/matrix-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
