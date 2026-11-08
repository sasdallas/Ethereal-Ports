#!/usr/bin/env bash

NAME="libgpg-error"
VERSION="1.61"
TARBALL_URL="https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-$VERSION.tar.bz2"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --enable-shared
}
