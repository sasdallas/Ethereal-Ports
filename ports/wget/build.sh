#!/usr/bin/env bash

NAME="wget"
VERSION="1.25.0"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/wget/wget-$VERSION.tar.gz"
DEPENDS=("zlib" "pcre2" "openssl")

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-ipv6 --disable-nls --with-ssl=openssl CFLAGS="-Dpthread_self=pthread_self"
}
