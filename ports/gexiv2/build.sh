#!/usr/bin/env bash

NAME="gexiv2"
VERSION="0.16.2"
TARBALL_URL="https://download.gnome.org/sources/gexiv2/${VERSION%.*}/gexiv2-$VERSION.tar.xz"
DEPENDS=("exiv2")

configure() {
    mkdir build-gexiv2 || true

    (
        pushd build-gexiv2
        meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX --reconfigure -Dvapi=false -Dpython3=false -Dintrospection=false || exit 1
        popd
    ) || exit 1
}

build() {
    pushd build-gexiv2
    ninja || exit 1
    popd
}

install() {
    pushd build-gexiv2
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
