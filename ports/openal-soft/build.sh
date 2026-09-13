#!/usr/bin/env bash

NAME="openal-soft"
VERSION="1.24.3"
TARBALL_URL="https://github.com/kcat/openal-soft/archive/refs/tags/$VERSION.tar.gz"
BUILD_DIR="openal-soft-$VERSION"
DEPENDS=("libsndfile" "SDL2" "zlib")

configure() {
    cmake --fresh -S . -B build -G Ninja \
            --toolchain=$CMAKE_CROSS \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=${PREFIX} \
            -DALSOFT_EXAMPLES=OFF \
            -DALSOFT_NO_CONFIG_UTIL=ON \
            -DALSOFT_BACKEND_SDL2=ON || exit 1
}

build() {
    cmake --build build -j $NPROC || exit 1
}

install() {
    cmake --install build -j $NPROC || exit 1
}
