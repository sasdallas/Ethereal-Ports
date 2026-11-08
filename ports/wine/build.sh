#!/usr/bin/env bash

NAME="wine"
VERSION="10.0"
TARBALL_URL="https://dl.winehq.org/wine/source/${VERSION%.*}.x/wine-$VERSION.tar.xz"
DEPENDS=("xorg-libraries" "glib" "openssl" "SDL2" "fontconfig")

pre_configure() {
    # Wine must be built for the host first
    mkdir -p $PORT_BUILD_DIR/wine-build-host || true
    mkdir -p $PORT_BUILD_DIR/wine-tools || true
    pushd $PORT_BUILD_DIR/wine-build-host

    ../wine-10.0/configure || exit 1
    make -j$NPROC || exit 1
    make DESTDIR=$PORT_BUILD_DIR/wine-tools install || exit 1

    popd
}

configure() {
    ./configure --host=$TRIPLET \
                --prefix=$PREFIX \
                --disable-tests \
                --disable-win16 \
                --enable-archs=i386,x86_64 \
                --with-x \
                --with-wine-tools=$PORT_BUILD_DIR/wine-tools \
                --enable-win64 \
                --without-xshape \
                --without-xinerama \
                --without-xcomposite
}
