#!/usr/bin/env bash

NAME="curl"
VERSION="8.11.1"
TARBALL_URL="https://curl.se/download/curl-$VERSION.tar.xz"
DEPENDS=("openssl" "zlib" "zstd")

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --with-ca-path=/etc/ssl/certs --with-ca-bundle=/etc/ssl/certs/ca-bundle.crt \
                --disable-threaded-resolver \
                --disable-ipv6 \
                --disable-docs \
                --disable-ntlm \
                --disable-static \
                --enable-optimize \
                --with-openssl \
                --with-zlib \
                --with-zstd \
                --without-libpsl
}
