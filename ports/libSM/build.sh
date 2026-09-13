#!/usr/bin/env bash

NAME="libSM"
VERSION="1.2.6"
TARBALL_URL="https://x.org/pub/individual/lib/libSM-1.2.6.tar.xz"
DEPENDS=("libX11" "fontconfig" "libICE")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
