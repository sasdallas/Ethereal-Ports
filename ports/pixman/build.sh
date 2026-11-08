#!/usr/bin/env bash

NAME="pixman"
VERSION="0.46.4"
TARBALL_URL="https://cairographics.org/releases/pixman-$VERSION.tar.gz"
DEPENDS=("glib" "libpng")

configure() {
    mkdir build-pixman || true
    pushd build-pixman
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX || exit 1
    popd
}

build() {
    pushd build-pixman
    ninja || exit 1
    popd
}

install() {
    pushd build-pixman
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
