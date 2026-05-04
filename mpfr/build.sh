#!/usr/bin/env bash

NAME="mpfr"
VERSION="4.2.2"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/mpfr/mpfr-$VERSION.tar.gz"
DEPENDS=("gmp")

configure() {
    ./configure --target=$TRIPLET --host=$TRIPLET --with-sysroot=/ --prefix=$PREFIX || exit 1
}
