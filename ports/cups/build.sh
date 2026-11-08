#!/usr/bin/env bash

NAME="cups"
VERSION="2.4.19"
TARBALL_URL="https://github.com/OpenPrinting/cups/releases/download/v$VERSION/cups-$VERSION-source.tar.gz"
BUILD_DIR="cups-$VERSION"
DEPENDS=("libiconv" "zlib")


configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX \
        --with-rcd=/tmp/cupsinit \
		--with-docdir=/usr/share/cups/doc \
		--disable-dbus \
		--disable-gssapi \
		--disable-pam \
		--disable-browsing \
		--with-tls=no \
		--with-components=libcups
    
	sed -i s/-Werror//g Makedefs
	sed -i s/-fstack-protector-strong//g Makedefs
	sed -i s/-fstack-protector//g Makedefs
	sed -i 's/[[:space:]]*-fPIE -pie//g' Makedefs
}

build() {
    make -j$NPROC CFLAGS="-fPIC" CXXFLAGS="-fPIC"
}
