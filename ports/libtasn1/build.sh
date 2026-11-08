#!/usr/bin/env bash

NAME="libtasn1"
VERSION="4.20.0"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/libtasn1/libtasn1-$VERSION.tar.gz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --disable-doc || exit 1
}
