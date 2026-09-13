#!/usr/bin/env bash

NAME="ClassiCube"
GIT_URL="https://github.com/ClassiCube/ClassiCube"
GIT_COMMIT="38c0bdd706ec0fbdebf85ea1b98f50bd93588c7d"
DEPENDS=("SDL2" "openal-soft" "openssl")

configure() {
    return
}

build() {
    make PLAT=ethereal CC=$CC -j$NPROC
}

install() {
    cp ClassiCube $SYSROOT/usr/bin/
}
