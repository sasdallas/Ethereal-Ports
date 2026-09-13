#!/usr/bin/env bash

NAME="libXvMC"
VERSION="1.0.15"
TARBALL_URL="https://x.org/pub/individual/lib/libXvMC-1.0.15.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
