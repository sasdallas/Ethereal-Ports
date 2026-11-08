#!/usr/bin/env bash

NAME="libxcrypt"
VERSION="4.4.36"
TARBALL_URL="https://github.com/besser82/libxcrypt/releases/download/v$VERSION/libxcrypt-$VERSION.tar.xz"
DEPENDS=("libgpg-error" "libiconv" "libintl")

configure() {
    ./configure --prefix=$PREFIX --host=TRIPLET --enable-obsolete-api=yes --disable-xcrypt-compat-files
}
