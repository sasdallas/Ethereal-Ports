#!/usr/bin/env bash

NAME="libXfont2"
VERSION="2.0.7"
TARBALL_URL="https://x.org/pub/individual/lib/libXfont2-2.0.7.tar.xz"
DEPENDS=("libX11" "fontconfig" "libfontenc")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
