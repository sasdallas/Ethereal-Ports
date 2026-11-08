#!/usr/bin/env bash

NAME="gegl"
VERSION="0.4.72"
TARBALL_URL="https://download.gimp.org/pub/gegl/${VERSION%.*}/gegl-$VERSION.tar.xz"
DEPENDS=("json-glib" "babl")

configure() {
    mkdir build-gegl || true

    (
        pushd build-gegl
        meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX --reconfigure || exit 1
        popd
    ) || exit 1
}

build() {
    pushd build-gegl
    ninja || exit 1
    popd
}

install() {
    pushd build-gegl
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
