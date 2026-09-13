#!/usr/bin/env bash

NAME="llvm"
VERSION="20.1.8"
TARBALL_URL="https://github.com/llvm/llvm-project/releases/download/llvmorg-$VERSION/llvm-project-$VERSION.src.tar.xz"
DEPENDS=("zlib" "zstd")
BUILD_DIR="llvm-project-$VERSION.src"

configure() {
    unset CC CXX LD
    mkdir build || true
    cmake --fresh -B build -S llvm -G Ninja \
        --toolchain=$CMAKE_CROSS \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DLLVM_ENABLE_PROJECTS= \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_TARGETS_TO_BUILD=X86 \
        -DLLVM_INCLUDE_BENCHMARKS=OFF \
        -DLLVM_INCLUDE_TESTS=OFF \
        -DLLVM_HOST_TRIPLE=$TRIPLET \
        -DLLVM_PARALLEL_LINK_JOBS=1 || exit 1
}

build() {
    cmake --build build -j $NPROC_SMALL || exit 1
}

install() {
    # llvm is big
    return
}
