#!/usr/bin/env bash

NAME="libxshmfence"
VERSION="1.3.3"
TARBALL_URL="https://x.org/pub/individual/lib/libxshmfence-$VERSION.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
