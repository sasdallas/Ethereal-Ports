#!/usr/bin/env bash

NAME="libXdamage"
VERSION="1.1.7"
TARBALL_URL="https://x.org/pub/individual/lib/libXdamage-1.1.7.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
