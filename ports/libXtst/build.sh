#!/usr/bin/env bash

NAME="libXtst"
VERSION="1.2.5"
TARBALL_URL="https://x.org/pub/individual/lib/libXtst-1.2.5.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
