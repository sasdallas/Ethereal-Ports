#!/usr/bin/env bash

NAME="p11-kit"
VERSION="0.25.5"
TARBALL_URL="https://github.com/p11-glue/p11-kit/releases/download/$VERSION/p11-kit-$VERSION.tar.xz"
DEPENDS=("libtasn1")

configure() {
    mkdir build-p11-kit || true
    pushd build-p11-kit
    meson setup --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dtrust_paths=/etc/cacert/extracted/cacert.pem -Dwrap_mode=nofallback -Dbuildtype=debug || exit 1
    popd
}

build() {
    pushd build-p11-kit
    ninja || exit 1
    popd
}

install() {
    pushd build-p11-kit
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
