#!/usr/bin/env bash

NAME="gcc"
VERSION="12.2.0"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/gcc/gcc-$VERSION/gcc-$VERSION.tar.gz"
DEPENDS=("gmp" "mpfr" "mpc")

configure() {
    ./configure --host=$TRIPLET --target=$TRIPLET --prefix=$PREFIX --enable-shared --enable-languages=c,c++
}

build() {
    make -j$NPROC all-gcc all-target-libgcc all-target-libstdc++-v3
}

install() {
    make DESTDIR=$SYSROOT -j$NPROC install-strip-gcc install-strip-target-libgcc install-strip-target-libstdc++-v3
}
