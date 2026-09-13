#!/usr/bin/env bash

NAME="libXv"
VERSION="1.0.13"
TARBALL_URL="https://x.org/pub/individual/lib/libXv-1.0.13.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
