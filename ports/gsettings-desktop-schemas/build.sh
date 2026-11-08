#!/usr/bin/env bash

NAME="gsettings-desktop-schemas"
VERSION="48.0"
TARBALL_URL="https://download.gnome.org/sources/gsettings-desktop-schemas/${VERSION%.*}/gsettings-desktop-schemas-$VERSION.tar.xz"
DEPENDS=("glib")


configure() {
    sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in || exit 1
    mkdir build-gsettings || true
    pushd build-gsettings
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dintrospection=false || exit 1
    popd
}

build() {
    pushd build-gsettings
    ninja || exit 1
    popd
}

install() {
    pushd build-gsettings
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
