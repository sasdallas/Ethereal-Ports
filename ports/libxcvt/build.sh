#!/usr/bin/env bash

NAME="libxcvt"
VERSION="0.1.3"
TARBALL_URL="https://www.x.org/pub/individual/lib/libxcvt-$VERSION.tar.xz"
DEPENDS=("xorgproto")

configure() {
    mkdir build || true
    pushd build
    meson setup .. --cross-file=$MESON_CROSS --prefix=$PREFIX
    popd
}

build() {
    pushd build
    ninja
    popd
}

install() {
    pushd build
    DESTDIR=$SYSROOT ninja install
    popd
}