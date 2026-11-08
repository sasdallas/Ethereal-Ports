#!/usr/bin/env bash

NAME="libjpeg-turbo"
VERSION="3.1.4.1"
TARBALL_URL="https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-$VERSION.tar.gz"

configure() {
    mkdir build-libjpeg || true
    pushd build-libjpeg
    cmake -S .. -B . --toolchain -G Ninja \
        --toolchain=$CMAKE_CROSS \
        -DENABLE_STATIC=FALSE \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DCMAKE_SKIP_INSTALL_RPATH=ON || exit 1
    popd
}

build() {
    pushd build-libjpeg
    ninja || exit 1
    popd
}

install() {
    pushd build-libjpeg
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
