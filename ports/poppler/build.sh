#!/usr/bin/env bash

NAME="poppler"
VERSION="26.09.0"
TARBALL_URL="https://poppler.freedesktop.org/poppler-$VERSION.tar.xz"
DEPENDS=("libtiff" "poppler-data")

configure() {
    mkdir build-poppler

    pushd build-poppler
    cmake -GNinja -S .. -B . --toolchain $CMAKE_CROSS \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=${PREFIX} \
            -DENABLE_QT5=OFF \
            -DENABLE_QT6=OFF \
            -DENABLE_BOOST=OFF \
            -DENABLE_NSS3=OFF \
            -DENABLE_GPGME=OFF \
            -DENABLE_UNSTABLE_API_ABI_HEADERS=ON || exit 1

    popd
}

build() {
    cmake --build build-poppler -j $NPROC || exit 1
}

install() {
    cmake --install build-poppler -j $NPROC || exit 1
}
