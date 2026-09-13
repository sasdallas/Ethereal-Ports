#!/usr/bin/env bash

NAME="libXpresent"
VERSION="1.0.2"
TARBALL_URL="https://x.org/pub/individual/lib/libXpresent-$VERSION.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
