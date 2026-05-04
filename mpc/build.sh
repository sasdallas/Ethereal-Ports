#!/usr/bin/env bash

NAME="mpc"
VERSION="1.3.1"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/mpc/mpc-$VERSION.tar.gz"
DEPENDS=("gmp" "mpfr")

configure() {
    ./configure --host=$TRIPLET --target=$TRIPLET --with-sysroot=$SYSROOT --prefix=/usr
}
