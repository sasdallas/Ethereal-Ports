#!/usr/bin/env bash

NAME="gdk-pixbuf"
VERSION="2.44.4"
TARBALL_URL="https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/archive/$VERSION/gdk-pixbuf-$VERSION.tar.gz"
DEPENDS=("glib" "libpng" "libjpeg" "shared-mime-info")


configure() {
    mkdir build-gdk-pixbuf || true
    pushd build-gdk-pixbuf
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dtests=false -Dman=false || exit 1
    popd
}

build() {
    pushd build-gdk-pixbuf
    ninja || exit 1
    popd
}

install() {
    pushd build-gdk-pixbuf
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
