#!/usr/bin/env bash

NAME="libxml2"
VERSION="2.14.5"
TARBALL_URL="https://download.gnome.org/sources/libxml2/${VERSION%.*}/libxml2-$VERSION.tar.xz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --with-threads --disable-ipv6 --without-python
}