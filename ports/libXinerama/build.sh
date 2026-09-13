#!/usr/bin/env bash

NAME="libXinerama"
VERSION="1.1.6"
TARBALL_URL="https://x.org/pub/individual/lib/libXinerama-1.1.6.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
