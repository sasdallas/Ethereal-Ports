#!/usr/bin/env bash

NAME="binutils"
VERSION="2.42"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/binutils/binutils-$VERSION.tar.xz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --with-sysroot=/
}
