#!/usr/bin/env bash

set -eu

NAME="tinycc"
GIT_URL="https://github.com/TinyCC/tinycc"
GIT_COMMIT="576cd2a9235cf955c25e786399d760a360020547"
BUILD_DIR="tinycc"

configure() {
    # Thanks to @tayoky for these
    ./configure \
        --sysroot=$SYSROOT \
        --targetos=ethereal \
        --cc=$CC \
        --triplet=$TRIPLET \
        --sysincludepaths=/usr/include:/usr/lib/tcc/include \
        --libpaths=/usr/lib:/usr/lib/tcc \
        --crtprefix=/usr/lib \
        --elfinterp=/usr/lib/ld.so || exit 1
}

build() {
    make all -j$NPROC XTCC=gcc XAR=ar || exit 1
}
