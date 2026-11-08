#!/usr/bin/env bash

NAME="glib"
VERSION="2.85.2"
TARBALL_URL="https://download.gnome.org/sources/glib/${VERSION%.*}/glib-$VERSION.tar.xz"
DEPENDS=("pcre2" "libffi" "zlib" "libiconv" "libintl")

configure() {
    mkdir build-glib || true
    pushd build-glib
    meson setup --cross-file $MESON_CROSS -Dprefix=/usr -Dxattr=false || exit 1
    popd
}

build() {
    pushd build-glib
    ninja || exit 1
    popd
}

install() {
    pushd build-glib
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
