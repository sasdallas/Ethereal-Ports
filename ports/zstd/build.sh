#!/usr/bin/env bash

NAME="zstd"
VERSION="1.5.7"
TARBALL_URL="https://github.com/facebook/zstd/releases/download/v$VERSION/zstd-$VERSION.tar.gz"

configure() {
    mkdir build-zstd || true
    cmake --fresh -B build-zstd -S build/cmake -G Ninja --toolchain=$CMAKE_CROSS -DCMAKE_INSTALL_PREFIX=$PREFIX || exit 1
}

build() {
    cmake --build build-zstd || exit 1
}

install() {
    cmake --install build-zstd || exit 1
}
