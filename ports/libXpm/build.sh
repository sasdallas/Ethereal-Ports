#!/usr/bin/env bash

NAME="libXpm"
VERSION="3.5.19"
TARBALL_URL="https://x.org/pub/individual/lib/libXpm-3.5.19.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
