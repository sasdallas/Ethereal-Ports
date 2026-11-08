#!/usr/bin/env bash

NAME="AppStream"
VERSION="1.1.2"
TARBALL_URL="https://www.freedesktop.org/software/appstream/releases/AppStream-1.1.2.tar.xz"
DEPENDS=("libfyaml")

configure() {
    mkdir build-appstream || true

    (
        unset PKG_CONFIG_DIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_LIBDIR PKG_CONFIG_PATH

        pushd build-appstream
        meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX -Dbash-completion=false -Dstemming=false -Dsystemd=false -Dgir=false -Dman=false -Dapidocs=false -Dinstall-docs=false --reconfigure || exit 1
        popd
    ) || exit 1
}

build() {
    pushd build-appstream
    ninja || exit 1
    popd
}

install() {
    pushd build-appstream
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
