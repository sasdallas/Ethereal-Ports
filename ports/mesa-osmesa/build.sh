#!/usr/bin/env bash

# Thank you to Mathewnd for his port of libdrm and Mesa which is where the patches come from.
# https://github.com/Mathewnd/Astral/

# Thank you to Bananymous for his subprojects patch
# https://github.com/Bananymous/banan-os/blob/main/ports/mesa/build.sh

NAME="mesa"
VERSION="25.0.7"
TARBALL_URL="https://archive.mesa3d.org/mesa-$VERSION.tar.xz"
BUILD_DIR="mesa-25.0.7"
VARIANT=1

configure() {
    mkdir build-mesa || true
    pushd build-mesa
    
    meson setup ..  -Dprefix=$PREFIX \
                    -Dbuildtype=release \
                    --cross-file $MESON_CROSS \
                    -Dosmesa=true \
                    -Dplatforms= \
                    -Dglx=disabled \
                    -Dgallium-drivers=softpipe \
                    -Dvulkan-drivers= \
                    -Dllvm=disabled \
                    -Dvalgrind=disabled \
                    -Dlibunwind=disabled \
                    -Dbuild-tests=false \
                    -Degl=disabled || exit 1
    popd
}

build() {
    pushd build-mesa
    ninja
    popd
}

install() {
    pushd build-mesa
    DESTDIR=$SYSROOT ninja install
    popd 
}
