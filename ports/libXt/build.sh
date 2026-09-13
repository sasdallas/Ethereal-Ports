#!/usr/bin/env bash

NAME="libXt"
VERSION="1.3.1"
TARBALL_URL="https://x.org/pub/individual/lib/libXt-1.3.1.tar.xz"
DEPENDS=("libX11" "fontconfig" "libSM" "libICE")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
