#!/usr/bin/env bash

NAME="dbus"
VERSION="1.16.2"
TARBALL_URL="https://dbus.freedesktop.org/releases/dbus/dbus-$VERSION.tar.xz"
DEPENDS=("glib" "expat")

configure() {
    mkdir build-dbus || true
    pushd build-dbus
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Depoll=disabled -Dintrusive_tests=false -Dinstalled_tests=false -Dmodular_tests=disabled || exit 1
    popd
}

build() {
    pushd build-dbus
    ninja || exit 1
    popd
}

install() {
    pushd build-dbus
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
