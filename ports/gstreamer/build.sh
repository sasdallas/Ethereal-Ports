#!/usr/bin/env bash

NAME="gstreamer"
VERSION="1.26.5"
TARBALL_URL="https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$VERSION.tar.xz"
DEPENDS=("glib" "gtk3")

configure() {
    mkdir build-gstreamer || true
    pushd build-gstreamer
    meson setup --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dtests=disabled -Dgst_debug=false || exit 1
    popd
}

build() {
    pushd build-gstreamer
    ninja || exit 1
    popd
}

install() {
    pushd build-gstreamer
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
