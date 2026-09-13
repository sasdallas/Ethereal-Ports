#!/usr/bin/env bash

NAME="openssl"
VERSION="3.3.1"
TARBALL_URL="https://github.com/openssl/openssl/releases/download/openssl-$VERSION/openssl-$VERSION.tar.gz"
DEPENDS=("zlib" "ca-certificates")

configure() {
    # Thank you Banan!
    ./Configure --prefix=$PREFIX --openssldir=/etc/ssl -DOPENSSL_USE_IPV6=0 no-asm no-tests ethereal-generic threads zlib
}

build() {
    make -j$NPROC
}

install() {
    make DESTDIR=$SYSROOT install_sw install_ssldirs -j$NPROC

    # create the SSL links
    # Thank you again Banan!
    rm -f "$SYSROOT/etc/ssl/certs"/*

    ln -svf "/etc/cacert/extracted/cacert.pem" "$SYSROOT/etc/ssl/cert.pem"
    ln -svf "/etc/cacert/extracted/cacert.pem" "$SYSROOT/etc/ssl/certs/ca-certificates.crt"
    ln -svf "/etc/cacert/extracted/cacert.pem" "$SYSROOT/etc/ssl/certs/ca-bundle.crt"

    openssl rehash $SYSROOT/etc/cacert/extracted
	find "$SYSROOT/etc/cacert/extracted" -type l -print0 |
	while IFS= read -r -d '' link; do
		ln -s "../../cacert/extracted/$(readlink "$link")" "$SYSROOT/etc/ssl/certs/${link##*/}"
		rm "$link"
	done
}
