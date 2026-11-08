#!/usr/bin/env bash

NAME="binutils"
VERSION="2.42"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/binutils/binutils-$VERSION.tar.xz"

pre_configure() {
    sed -i 's/$(ZLIBINC) $(ZSTD_CFLAGS)/$(ZLIBINC)/' binutils/Makefile.am
    sed -i 's/$(ZLIBINC) $(ZSTD_CFLAGS)/$(ZLIBINC)/' binutils/Makefile.in
}

configure() {
    ./configure --build=$(uname -m) --host=$TRIPLET --target=$TRIPLET --prefix=$PREFIX --with-sysroot=/ --enable-default-execstack=no --disable-werror
}
