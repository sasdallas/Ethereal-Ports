#!/usr/bin/env bash

NAME="libXrandr"
VERSION="1.5.5"
TARBALL_URL="https://x.org/pub/individual/lib/libXrandr-1.5.5.tar.xz"
DEPENDS=("libX11" "libXrender" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
