#!/usr/bin/env bash

NAME="shared-mime-info"
VERSION="2.4"
TARBALL_URL="https://gitlab.freedesktop.org/xdg/shared-mime-info/-/archive/$VERSION/shared-mime-info-$VERSION.tar.gz"
DEPENDS=("glib" "libxml2")

configure() {
    mkdir build-shared-mime || true
    pushd build-shared-mime
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dbuild-tests=false -Dbuild-translations=false -Dupdate-mimedb=true || exit 1
    popd
}

build() {
    pushd build-shared-mime
    ninja || exit 1
    popd
}

install() {
    pushd build-shared-mime
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
