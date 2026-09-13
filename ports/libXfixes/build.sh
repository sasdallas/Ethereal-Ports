#!/usr/bin/env bash

NAME="libXfixes"
VERSION="6.0.2"
TARBALL_URL="https://x.org/pub/individual/lib/libXfixes-6.0.2.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
