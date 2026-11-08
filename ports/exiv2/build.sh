#!/usr/bin/env bash

NAME="exiv2"
VERSION="0.28.9"
TARBALL_URL="https://github.com/Exiv2/exiv2/archive/v$VERSION/exiv2-$VERSION.tar.gz"
DEPENDS=("brotli")

configure() {
    mkdir build-exiv2

    pushd build-exiv2
    cmake -GNinja -S .. -B . --toolchain $CMAKE_CROSS \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=${PREFIX} \
            -DEXIV2_ENABLE_INIH=OFF \
            -DBUILD_WITH_STACK_PROTECTOR=OFF || exit 1

    popd
}

build() {
    cmake --build build-exiv2 -j $NPROC || exit 1
}

install() {
    cmake --install build-exiv2 -j $NPROC || exit 1
}
