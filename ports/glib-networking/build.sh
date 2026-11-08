#!/usr/bin/env bash

NAME="glib-networking"
VERSION="2.80.1"
TARBALL_URL="https://download.gnome.org/sources/glib-networking/${VERSION%.*}/glib-networking-$VERSION.tar.xz"
DEPENDS=("glib" "gnutls")

configure() {
    mkdir build-glib-networking || true

    (
        pushd build-glib-networking
        meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX --reconfigure -Dlibproxy=disabled || exit 1
        popd
    ) || exit 1
}

build() {
    pushd build-glib-networking
    ninja || exit 1
    popd
}

install() {
    pushd build-glib-networking
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
