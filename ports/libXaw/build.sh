#!/usr/bin/env bash

NAME="libXaw"
VERSION="1.0.16"
TARBALL_URL="https://x.org/pub/individual/lib/libXaw-1.0.16.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
