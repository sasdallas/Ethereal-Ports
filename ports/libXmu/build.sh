#!/usr/bin/env bash

NAME="libXmu"
VERSION="1.3.1"
TARBALL_URL="https://x.org/pub/individual/lib/libXmu-1.3.1.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
