#!/usr/bin/env bash

NAME="libgcrypt"
VERSION="1.12.2"
TARBALL_URL="https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-$VERSION.tar.bz2"
DEPENDS=("libgpg-error")

configure() {
    ./configure --prefix=$PREFIX --host=$TRIPLET --enable-shared --disable-doc --disable-dev-random --disable-asm --with-libgpg-error-prefix=$SYSROOT/$PREFIX
}
