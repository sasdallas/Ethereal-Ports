#!/usr/bin/env bash

NAME="json-glib"
VERSION="1.10.8"
TARBALL_URL="https://download.gnome.org/sources/json-glib/${VERSION%.*}/json-glib-$VERSION.tar.xz"
DEPENDS=("glib")

configure() {
    mkdir build-json-glib || true

    (
        pushd build-json-glib
        meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dgtk_doc=disabled -Dintrospection=disabled -Ddocumentation=disabled -Dtests=false  --reconfigure || exit 1
        popd
    ) || exit 1
}

build() {
    pushd build-json-glib
    ninja || exit 1
    popd
}

install() {
    pushd build-json-glib
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
