#!/usr/bin/env bash

NAME="libxcb"
VERSION="1.17.0"
TARBALL_URL="https://xorg.freedesktop.org/archive/individual/lib/libxcb-$VERSION.tar.xz"
DEPENDS=("libXau" "xcb-proto" "libXdmcp")

pre_configure() {
    # Required on some systems (like mine)
    export ACLOCAL_PATH="/usr/share/aclocal/"
    autoreconf -i
}

configure() {
    patch -p1 < ../../ports/libxcb/after_reconf_patch.patch
    ./configure --host=$TRIPLET --prefix=$PREFIX --without-doxygen --disable-static --with-sysroot=$SYSROOT
}
