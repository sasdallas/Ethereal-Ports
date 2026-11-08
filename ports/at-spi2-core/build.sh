#!/usr/bin/env bash

NAME="at-spi2-core"
VERSION="2.56.4"
TARBALL_URL="https://download.gnome.org/sources/at-spi2-core/${VERSION%.*}/at-spi2-core-$VERSION.tar.xz"
DEPENDS=("dbus" "glib" "gsettings-desktop-schemas" "xorg-libraries" "libxml2")

configure() {
    mkdir build-at-spi2 || true
    pushd build-at-spi2
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dgtk2_atk_adaptor=false -Duse_systemd=false -Ddocs=false -Dx11=enabled -Dsystemd_user_dir=/tmp || exit 1
    popd
}

build() {
    pushd build-at-spi2
    ninja || exit 1
    popd
}

install() {
    pushd build-at-spi2
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
