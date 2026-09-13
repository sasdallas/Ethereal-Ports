#!/usr/bin/env bash

NAME="mpc"
VERSION="1.3.1"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/mpc/mpc-$VERSION.tar.gz"
DEPENDS=("mpfr")

configure() {
    ./configure --target=$TRIPLET --host=$TRIPLET --with-sysroot=/ --prefix=$PREFIX || exit 1
}
