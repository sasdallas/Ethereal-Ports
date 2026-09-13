#!/usr/bin/env bash

NAME="libFS"
VERSION="1.0.10"
TARBALL_URL="https://x.org/pub/individual/lib/libFS-1.0.10.tar.xz"
DEPENDS=("libX11" "fontconfig")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static --disable-malloc0returnsnull
}
