#!/usr/bin/env bash

NAME="libxslt"
VERSION="1.1.43"
TARBALL_URL="https://download.gnome.org/sources/libxslt/${VERSION%.*}/libxslt-$VERSION.tar.xz"
DEPENDS=("libxml2")

configure() {
    PKG_CONFIG=/usr/bin/pkg-config ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --without-python
}
