#!/usr/bin/env bash

NAME="aspell"
VERSION="0.60.8.1"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/aspell/aspell-$VERSION.tar.gz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --sysconfdir=/etc --enable-shared
}

install() {
    make DESTDIR=$SYSROOT install
	ln -svfn aspell-0.60 $SYSROOT/usr/bin/aspell 
}
