#!/usr/bin/env bash

NAME="poppler-data"
VERSION="0.4.12"
TARBALL_URL="https://poppler.freedesktop.org/poppler-data-$VERSION.tar.gz"

configure() {
    return
}

build() {
    return
}

install() {
    make prefix=/usr DESTDIR=$SYSROOT install || exit 1
}
