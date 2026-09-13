#!/usr/bin/env bash

NAME="bash"
VERSION="5.2"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/bash/bash-$VERSION.tar.gz"
DEPENDS=("ncurses")

configure() {
    CFLAGS_FOR_BUILD="-std=gnu17" ./configure --host=$TRIPLET --prefix=$PREFIX --without-bash-malloc --disable-loadables
}
