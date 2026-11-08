#!/usr/bin/env bash

NAME="libepoxy"
VERSION="1.5.10"
TARBALL_URL="https://download.gnome.org/sources/libepoxy/${VERSION%.*}/libepoxy-$VERSION.tar.xz"
DEPENDS=("mesa") # !! must be the mesa-glx variant but have no way of checking that yet

configure() {
    mkdir build-libepoxy || true
    pushd build-libepoxy

    meson setup ..  -Dprefix=$PREFIX \
                    --cross-file=$MESON_CROSS \
                    -Dtests=false \
                    -Degl=yes || exit 1

    popd
}

build() {
    pushd build-libepoxy
    ninja
    popd
}

install() {
    pushd build-libepoxy
    DESTDIR=$SYSROOT ninja install
    popd
}
