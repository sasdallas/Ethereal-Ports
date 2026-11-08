#!/usr/bin/env bash

set -eu

NAME="xbanan"
VERSION="1.0.0"
GIT_URL="https://github.com/Bananymous/xbanan"
GIT_COMMIT="d0f2b5e8a629cd8b2f2689b4e0f47d710f73f3df"
BUILD_DIR="xbanan"

pre_configure() {
    # TODO move these to build_port.sh
    git submodule init
    git submodule update
}

configure() {
    sed -i 's/strerrordesc_np/strerror/' banan-os/BAN/include/BAN/Errors.h || exit 1
    mkdir build
    cmake -S . -B build --fresh \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DPLATFORM="ethereal" \
        -DCMAKE_INSTALL_INCLUDEDIR=$SYSROOT/usr/include/ \
        -DFONT_PATH=/usr/share/fonts/xbanan/fonts \
        --toolchain=$CMAKE_CROSS || exit 1
}

build() {
    cmake --build build || exit 1
}

install() {
    mkdir -p $SYSROOT/usr/bin || true
    cp build/xbanan/xbanan $SYSROOT/usr/bin/

    # Install font package
    mkdir -p $SYSROOT/usr/share/fonts/xbanan/fonts
    cp -r fonts/misc/ $SYSROOT/usr/share/fonts/xbanan/fonts/
}
