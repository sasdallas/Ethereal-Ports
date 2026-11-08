#!/usr/bin/env bash

NAME="hlsdk-portable"
VERSION="1.0.0"
GIT_URL="https://github.com/FWGS/hlsdk-portable"
GIT_COMMIT="895b28d0379f8902051d2b733029fc6a0fa9989c"
DEPENDS=("xash3d-fwgs")


pre_configure() {
    # TODO move these to build_port.sh
    git submodule update --init --recursive
}

configure() {
    ./waf configure -T release || exit 1
}

build() {
    ./waf build || exit 1
}

install() {
    mkdir -p $SYSROOT/usr/share/games/halflife/ || true
    mkdir -p $SYSROOT/usr/bin/ || true
    ./waf install --destdir="$SYSROOT/usr/share/games/halflife" || exit 1
}
