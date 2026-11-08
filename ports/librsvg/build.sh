#!/usr/bin/env bash

NAME="librsvg"
VERSION="2.40.21"
TARBALL_URL="https://download.gnome.org/sources/librsvg/${VERSION%.*}/librsvg-$VERSION.tar.xz"
DEPENDS=("cairo" "pango")

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --enable-introspection=no --enable-vala=no || exit 1
}