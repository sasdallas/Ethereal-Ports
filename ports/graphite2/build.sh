#!/usr/bin/env bash

NAME="graphite2"
VERSION="1.3.14"
TARBALL_URL="https://github.com/silnrsi/graphite/releases/download/$VERSION/graphite2-$VERSION.tgz"

pre_configure() {
    # taken from BLFS
    sed -i '/cmake_policy(SET CMP0012 NEW)/d' CMakeLists.txt &&
    sed -i 's/PythonInterp/Python3/' CMakeLists.txt          &&
    find . -name CMakeLists.txt | xargs sed -i 's/VERSION 2.8.0 FATAL_ERROR/VERSION 4.0.0/' || exit 1
    sed -i '/Font.h/i #include <cstdint>' tests/featuremap/featuremaptest.cpp || exit 1
}

configure() {
    
    mkdir build-graphite || true
    pushd build-graphite
    cmake -S .. -B . -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX=$PREFIX --toolchain=$CMAKE_CROSS || exit 1
    popd
}

build() {
    pushd build-graphite
    make -j$NPROC || exit 1
    popd
}

install() {
    pushd build-graphite
    make install || exit 1
    popd
}
