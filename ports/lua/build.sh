#!/usr/bin/env bash

NAME="lua"
VERSION="5.4.7"
TARBALL_URL="https://www.lua.org/ftp/lua-$VERSION.tar.gz"

configure() {
    return
}

build() {
    make -j$(NRPOC) || exit 1
}

install() {
    # "borrowed" from the banan-os port
	make install INSTALL_DATA='cp -d' INSTALL_TOP="$SYSROOT/usr" TO_LIB="liblua.so liblua.so.${VERSION%.*} liblua.so.$VERSION" || exit 1
}
