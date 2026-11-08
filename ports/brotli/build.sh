#!/usr/bin/env bash

NAME="brotli"
VERSION="1.1.0"
TARBALL_URL="https://github.com/google/brotli/archive/v$VERSION/brotli-$VERSION.tar.gz"

configure() {
    mkdir build-brotli

    pushd build-brotli
    cmake -GNinja -S .. -B . --toolchain $CMAKE_CROSS \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=${PREFIX} || exit 1

    popd
}

build() {
    cmake --build build-brotli -j $NPROC || exit 1
}

install() {
    cmake --install build-brotli -j $NPROC || exit 1
}
