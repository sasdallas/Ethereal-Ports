#!/usr/bin/env bash

NAME="gnutls"
VERSION="3.8.10"
TARBALL_URL="https://www.gnupg.org/ftp/gcrypt/gnutls/v${VERSION%.*}/gnutls-$VERSION.tar.xz"
DEPENDS=("nettle" "libtasn1" "p11-kit" "zlib" "zstd")

# TODO libunistring and also figure out why it can't build without included-libtasn1

configure() {
    ./configure --prefix=/usr --host=$TRIPLET \
        --with-default-trust-store-pkcs11=pkcs11: \
        --disable-static \
        --enable-shared \
        --with-included-unistring \
        --with-included-libtasn1 \
        --with-sysroot=$SYSROOT \
        --with-libdl-prefix=$SYSROOT \
        --disable-doc
}
