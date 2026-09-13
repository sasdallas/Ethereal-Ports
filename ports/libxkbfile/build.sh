#!/usr/bin/env bash

NAME="libxkbfile"
VERSION="1.1.1"
TARBALL_URL="https://x.org/pub/individual/lib/libxkbfile-$VERSION.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
