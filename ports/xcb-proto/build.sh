#!/usr/bin/env bash

NAME="xcb-proto"
VERSION="1.17.0"
TARBALL_URL="https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-$VERSION.tar.xz"

configure() {
    PYTHON=python3 ./configure --host=$TRIPLET --prefix=$PREFIX || exit 1
}

build() {
    return
}
