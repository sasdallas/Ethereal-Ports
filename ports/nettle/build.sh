#!/usr/bin/env bash

NAME="nettle"
VERSION="3.10.2"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/nettle/nettle-$VERSION.tar.gz"
DEPENDS=("gmp")

configure() {
    ./configure --host=x86_64-ethereal --prefix=/usr --disable-static --enable-shared
}
