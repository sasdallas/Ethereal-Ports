#!/usr/bin/env bash

NAME="babl"
VERSION="0.1.128"
TARBALL_URL="https://download.gimp.org/pub/babl/${VERSION%.*}/babl-$VERSION.tar.xz"
DEPENDS=("glib")

configure() {
    mkdir build-babl || true

    (
        pushd build-babl
        meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Denable-gir=false -Denable-vapi=false --reconfigure || exit 1
        popd
    ) || exit 1
}

build() {
    pushd build-babl
    ninja || exit 1
    popd
}

install() {
    pushd build-babl
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
