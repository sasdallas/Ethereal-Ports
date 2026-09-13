#!/usr/bin/env bash

NAME="lynx"
VERSION="2.9.2"
TARBALL_URL="https://invisible-island.net/archives/lynx/tarballs/lynx$VERSION.tar.gz"
DEPENDS=("ncurses" "openssl" "libiconv" "bzip2" "zlib" "zstd")
BUILD_DIR="lynx$VERSION"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --with-screen=ncurses --with-ssl
}
