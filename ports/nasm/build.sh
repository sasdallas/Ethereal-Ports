#!/usr/bin/env bash

NAME="nasm"
VERSION="2.16.03"
TARBALL_URL="https://www.nasm.us/pub/nasm/releasebuilds/$VERSION/nasm-$VERSION.tar.xz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-gdb
}
