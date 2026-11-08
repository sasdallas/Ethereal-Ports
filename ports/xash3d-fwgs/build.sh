#!/usr/bin/env bash

NAME="xash3d-fwgs"
VERSION="1.0.0"
GIT_URL="https://github.com/FWGS/xash3d-fwgs.git"
GIT_COMMIT="97b8fa74a7eda721fa78207c9bc7a5942b4d8790"
DEPENDS=("SDL2" "bzip2" "libvorbis")

pre_configure() {
    # TODO move these to build_port.sh
    git submodule update --init --recursive
}

configure() {
    pushd 3rdparty/vorbis/vorbis-src/
    git apply $PORT_BUILD_DIR/../ports/xash3d-fwgs/vorbis-src.patch || exit 1
    popd

    pushd 3rdparty/mainui/
    git apply $PORT_BUILD_DIR/../ports/xash3d-fwgs/mainui.patch || exit 1
    popd

    ./waf configure -T release --skip-sdl2-sanity-check --sdl-use-pkgconfig || exit 1
}

build() {
    ./waf build || exit 1
}

install() {
    mkdir -p $SYSROOT/usr/share/games/halflife/ || true
    mkdir -p $SYSROOT/usr/bin/ || true
    ./waf install --destdir="$SYSROOT/usr/share/games/halflife" || exit 1

    cat > "$SYSROOT/usr/bin/start-halflife" << EOF
#!/bin/sh
cd /usr/share/games/halflife
export LD_LIBRARY_PATH=/usr/share/games/halflife/
./xash3d -console
EOF
    chmod +x $SYSROOT/usr/bin/start-halflife
}