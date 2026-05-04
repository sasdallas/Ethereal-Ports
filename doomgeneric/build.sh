#!/usr/bin/env bash

NAME="doomgeneric"
GIT_URL="https://github.com/ozkl/doomgeneric"
GIT_COMMIT="ee0c159d5cfc0483f6c0e83c8130924093b4751c"

configure() {
    return
}

build() {
    pushd doomgeneric >/dev/null
    make -j$NPROC CC=$CC || exit 1
    popd >/dev/null
}

install() {
    pushd doomgeneric >/dev/null
    cp doomgeneric $SYSROOT/usr/bin/
    popd >/dev/null
}
