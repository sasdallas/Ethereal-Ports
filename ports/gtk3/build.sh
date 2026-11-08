#!/usr/bin/env bash

NAME="gtk3"
VERSION="3.24.49"
TARBALL_URL="https://download.gnome.org/sources/gtk/${VERSION%.*}/gtk-$VERSION.tar.xz"
BUILD_DIR="gtk-$VERSION"
DEPENDS=("at-spi2-core" "gdk-pixbuf" "libepoxy" "pango")

configure() {
    mkdir build-gtk || true
    pushd build-gtk
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dintrospection=false -Dx11_backend=true -Dwayland_backend=false -Dexamples=false -Dtests=false || exit 1
    popd
}

build() {
    pushd build-gtk
    ninja || exit 1
    popd
}

install() {
    pushd build-gtk
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
