#!/usr/bin/env bash

NAME="libXft"
VERSION="2.3.9"
TARBALL_URL="https://x.org/pub/individual/lib/libXft-2.3.9.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
