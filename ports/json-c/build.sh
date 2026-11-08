#!/usr/bin/env bash

NAME="json-c"
VERSION="0.19"
TARBALL_URL="https://s3.amazonaws.com/json-c_releases/releases/json-c-$VERSION.tar.gz"

configure() {
    mkdir build-json-c

    pushd build-json-c
    cmake -GNinja -S .. -B . --toolchain $CMAKE_CROSS \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=${PREFIX} \
            -DBUILD_STATIC_LIBS=OFF || exit 1

    popd
}

build() {
    cmake --build build-json-c -j $NPROC || exit 1
}

install() {
    cmake --install build-json-c -j $NPROC || exit 1
}
