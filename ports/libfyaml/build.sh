#!/usr/bin/env bash

NAME="libfyaml"
VERSION="0.9.6"
TARBALL_URL="https://github.com/pantoniou/libfyaml/releases/download/v$VERSION/libfyaml-$VERSION.tar.gz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-nls --disable-i18n --disable-introspection
}

post_install() {
    # ???
    sed -i "s/none required//g" $SYSROOT/usr/lib/pkgconfig/libfyaml.pc || true
}