#!/usr/bin/env bash

NAME="libdrm"
VERSION="2.4.122"
TARBALL_URL="https://dri.freedesktop.org/libdrm/libdrm-$VERSION.tar.xz"

configure() {
    mkdir build-libdrm || true
    pushd build-libdrm

    meson setup ..  -Dprefix=$PREFIX \
                    -Dintel=disabled \
                    -Dradeon=disabled \
                    -Damdgpu=disabled \
                    -Dnouveau=disabled \
                    -Dvmwgfx=disabled \
                    -Domap=disabled \
                    -Dexynos=disabled \
                    -Dfreedreno=disabled \
                    -Dvc4=disabled \
                    -Detnaviv=disabled \
                    -Dtegra=disabled \
                    -Dtests=false \
                    --cross-file=../../../ethereal-meson.txt
    
    popd
}

build() {
    pushd build-libdrm

    ninja

    popd
}

install() {
    pushd build-libdrm

    DESTDIR=$SYSROOT ninja install

    popd
}
