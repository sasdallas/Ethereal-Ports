#!/usr/bin/env bash

NAME="libXres"
VERSION="1.2.3"
TARBALL_URL="https://x.org/pub/individual/lib/libXres-1.2.3.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
