#!/usr/bin/env bash

NAME="libXxf86vm"
VERSION="1.1.7"
TARBALL_URL="https://x.org/pub/individual/lib/libXxf86vm-1.1.7.tar.xz"
DEPENDS=("libXext" "xorgproto")

configure() {
  ./configure --host=$TRIPLET --prefix=$PREFIX --enable-shared --disable-static
}
