#!/usr/bin/env bash

NAME="libXext"
VERSION="1.3.7"
TARBALL_URL="https://x.org/pub/individual/lib/libXext-1.3.7.tar.xz"
DEPENDS=("libX11")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
