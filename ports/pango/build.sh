#!/usr/bin/env bash

NAME="pango"
VERSION="1.56.4"
TARBALL_URL="https://download.gnome.org/sources/pango/${VERSION%.*}/pango-$VERSION.tar.xz"
DEPENDS=("fontconfig" "cairo" "xorg-libraries" "fribidi" "glib")

configure() {
    mkdir build-pango || true
    pushd build-pango
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dintrospection=disabled || exit 1
    popd
}

build() {
    pushd build-pango
    ninja || exit 1
    popd
}

install() {
    pushd build-pango
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
