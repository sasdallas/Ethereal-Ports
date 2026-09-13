#!/usr/bin/env bash

NAME="libXi"
VERSION="1.8.3"
TARBALL_URL="https://x.org/pub/individual/lib/libXi-1.8.3.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
