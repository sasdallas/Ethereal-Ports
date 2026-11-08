#!/usr/bin/env bash

NAME="harfbuzz"
VERSION="11.4.1"
TARBALL_URL="https://github.com/harfbuzz/harfbuzz/releases/download/$VERSION/harfbuzz-$VERSION.tar.xz"
DEPENDS=("graphite2" "icu")

configure() {
    mkdir build-harfbuzz || true
    pushd build-harfbuzz
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dgraphite2=enabled || exit 1
    popd
}

build() {
    pushd build-harfbuzz
    ninja
    popd
}

install() {
    pushd build-harfbuzz
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
