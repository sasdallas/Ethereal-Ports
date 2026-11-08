#!/usr/bin/env bash

NAME="cairo"
VERSION="1.18.4"
TARBALL_URL="https://cairographics.org/releases/cairo-$VERSION.tar.xz"
DEPENDS=("libpng" "pixman" "fontconfig" "glib" "libX11" "libXrender" "libXext")

configure () {
    mkdir build-cairo || true
    pushd build-cairo
    meson setup .. -Dprefix=$PREFIX --cross-file $MESON_CROSS -Dtests=disabled || exit 1
    popd
}

build() {
    pushd build-cairo
    ninja || exit 1
    popd
}

install() {
    pushd build-cairo
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
