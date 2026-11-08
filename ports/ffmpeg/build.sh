#!/usr/bin/env bash

NAME="ffmpeg"
VERSION="8.0.1"
TARBALL_URL="https://ffmpeg.org/releases/ffmpeg-$VERSION.tar.xz"
DEPENDS=("SDL2")

configure() {
    ./configure --prefix=$PREFIX --target-os=none --arch=$CROSS_ARCH --cc=$TRIPLET-gcc --cxx=$TRIPLET-g+= --enable-cross-compile --enable-shared --disable-static --disable-doc --enable-gpl --enable-version3 --enable-openssl --extra-cflags="-D_DEFAULT_SOURCE"
}