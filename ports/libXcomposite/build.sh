#!/usr/bin/env bash

NAME="libXcomposite"
VERSION="0.4.7"
TARBALL_URL="https://x.org/pub/individual/lib/libXcomposite-0.4.7.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
