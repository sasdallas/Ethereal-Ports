#!/usr/bin/env bash

NAME="sdl12-compat"
VERSION="1.2.68"
TARBALL_URL="https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-$VERSION.tar.gz"
BUILD_DIR="sdl12-compat-release-$VERSION"
DEPENDS=("SDL2" "glu")

configure() {
    sed -i 's/CMAKE_INSTALL_FULL_DATAROOTDIR/CMAKE_INSTALL_DATADIR/' CMakeLists.txt
    mkdir build || exit 1

    cmake --fresh -G Ninja -S . -B build --toolchain $CMAKE_CROSS \
            -DCMAKE_INSTALL_PREFIX=${PREFIX} \
            -DCMAKE_BUILD_TYPE=Release \
            -DSDL2_INCLUDE_DIR="$SYSROOT/usr/include/SDL2" || exit 1
}

build() {
    cmake --build build -j $NPROC || exit 1
}

install() {
    cmake --install build -j $NPROC || exit 1
}

