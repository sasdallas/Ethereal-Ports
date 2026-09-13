#!/usr/bin/env bash

NAME="glu"
VERSION="9.0.3"
TARBALL_URL="https://archive.mesa3d.org/glu/glu-$VERSION.tar.xz"
DEPENDS=("mesa")

configure() {
    meson setup --reconfigure --cross-file "$MESON_CROSS" \
                -Dprefix=${PREFIX} \
                -Dbuildtype=release \
                -Dgl_provider=osmesa build || exit 1
}

build() {
    meson compile -C build -j$NPROC || exit 1
}

install() {
    meson install --destdir="$SYSROOT" -C build || exit 1
}
