#!/usr/bin/env bash

NAME="tar"
VERSION="1.35"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/tar/tar-$VERSION.tar.xz"
DEPENDS=("libintl" "gzip" "xz")

configure() {
    LDFLAGS="-lintl -liconv" ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --with-libintl-prefix=$SYSROOT/usr/
}
