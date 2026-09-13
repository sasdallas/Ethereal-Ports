#!/usr/bin/env bash

NAME="zlib"
VERSION="1.3.2"
TARBALL_URL="https://github.com/madler/zlib/releases/download/v$VERSION/zlib-$VERSION.tar.xz"

configure() {
    CHOST=$TRIPLET CC=$TRIPLET-gcc ./configure --prefix=$PREFIX
}
