#!/usr/bin/env bash

NAME="gmp"
VERSION="6.2.1"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/gmp/gmp-$VERSION.tar.bz2"


configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
