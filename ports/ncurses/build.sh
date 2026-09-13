#!/usr/bin/env bash

NAME="ncurses"
VERSION="6.5"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/ncurses/ncurses-$VERSION.tar.gz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --with-shared --without-ada --without-manpages --enable-pc-files --enable-sigwinch --disable-widec --with-pkg-config="$(which pkg-config)" --with-pkg-config-libdir=/usr/lib/pkg-config
}

pre_build() {
    sed -i 's/#define HAVE_TSEARCH .*/#undef HAVE_TSEARCH/' include/ncurses_cfg.h
}
