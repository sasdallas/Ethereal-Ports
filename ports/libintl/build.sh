#!/usr/bin/env bash

NAME="libintl"
VERSION="0.22.5"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/gettext/gettext-$VERSION.tar.gz"
BUILD_DIR="gettext-$VERSION"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --without-emacs --without-lispdir --enable-nls --with-included-gettext --disable-c++ --disable-libasprintf --disable-java --enable-threads=posix --disable-curses --without-git --without-cvs --without-bzip2 --without-xz --disable-static || exit 1
	sed -i 's/touch $@//g' gettext-runtime/intl/Makefile
}

build() {
    make -C gettext-runtime/intl -j$NPROC || exit 1
}

install() {
    make DESTDIR=$SYSROOT -C gettext-runtime/intl -j$NPROC install || exit 1 
}
