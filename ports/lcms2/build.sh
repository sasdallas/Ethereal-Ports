#!/usr/bin/env bash

NAME="lcms2"
VERSION="2.17"
TARBALL_URL="https://github.com/mm2/Little-CMS/releases/download/lcms$VERSION/lcms2-$VERSION.tar.gz"

configure() {
    mkdir build-lcms2 || true

    (
        pushd build-lcms2
        meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX --reconfigure || exit 1
        popd
    ) || exit 1
}

build() {
    pushd build-lcms2
    ninja || exit 1
    popd
}

install() {
    pushd build-lcms2
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
