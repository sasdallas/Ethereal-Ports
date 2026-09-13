#!/usr/bin/env bash

NAME="libiconv"
VERSION="1.19"
TARBALL_URL="https://ftpmirror.gnu.org/libiconv/libiconv-$VERSION.tar.gz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
