#!/usr/bin/env bash

NAME="libXrender"
VERSION="0.9.12"
TARBALL_URL="https://x.org/pub/individual/lib/libXrender-0.9.12.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
