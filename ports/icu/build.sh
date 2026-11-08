#!/usr/bin/env bash

NAME="icu"
VERSION="77.1"
TARBALL_URL="https://github.com/unicode-org/icu/releases/download/release-${VERSION//./-}/icu4c-${VERSION//./_}-src.tgz"
BUILD_DIR="icu"

pre_configure() {
    # add config for ethereal
    pushd source
    cp config/mh-linux config/mh-unknown || exit 1
    popd

    # ICU needs a host build
    mkdir build-host || true
    pushd build-host
    (
        unset CC CXX LD RANLIB AS TARGET ARCH TRIPLET PKG_CONFIG_LIBDIR PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_SYSROOT_DIR
        ../source/configure --disable-static || exit 1
        make -j$NPROC || exit 1
    ) || exit 1
    popd
}

configure() {
    mkdir build-icu || true
    pushd build-icu
    ../source/configure --host=$TRIPLET --target=$TRIPLET --prefix=$PREFIX --with-cross-build=$(pwd)/../build-host/ --with-data-packaging=library --disable-static || exit 1
    popd
}

build() {
    pushd build-icu

    (
        unset TARGET
        make -j$NPROC || exit 1
    ) || exit 1

    popd
}

install() {
    pushd build-icu

    (
        unset TARGET
        make DESTDIR=$SYSROOT -j$NPROC install || exit 1
    ) || exit 1

    popd
}
