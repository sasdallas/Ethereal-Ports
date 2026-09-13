#!/usr/bin/env bash

# Thank you to Mathewnd for his port of libdrm and Mesa which is where the patches come from.
# https://github.com/Mathewnd/Astral/

# Thank you to Bananymous for his subprojects patch
# https://github.com/Bananymous/banan-os/blob/main/ports/mesa/build.sh

NAME="mesa"
VERSION="25.0.7"
TARBALL_URL="https://archive.mesa3d.org/mesa-$VERSION.tar.xz"
DEPENDS=("llvm")
BUILD_DIR="mesa-25.0.7"

LLVM_VERSION="20.1.8"
LLVM_PATH="$PORT_BUILD_DIR/llvm-project-$LLVM_VERSION.src/"


configure() {
    # we didn't install LLVM (and even if we did it wouldnt work since it relies on llvm-config)
    # create a subprojects file
    mkdir -p subprojects/llvm/
    echo -e "project('llvm', ['cpp'])" > subprojects/llvm/meson.build
    echo -e "cpp = meson.get_compiler('cpp')" >> subprojects/llvm/meson.build
    echo -e "_deps = []" >> subprojects/llvm/meson.build
    echo -e "_search = '$LLVM_PATH/build/lib/'" >> subprojects/llvm/meson.build
    echo -e "foreach d : [" >> subprojects/llvm/meson.build
    echo $LLVM_PATH/build/lib/libLLVM*.a
    for path in $LLVM_PATH/build/lib/libLLVM*.a; do
        name=$(basename $path)
        echo -e "\t'${name:3:-2}'," >> subprojects/llvm/meson.build
    done
    echo " ]" >> subprojects/llvm/meson.build
    echo "_deps += cpp.find_library(d, dirs : _search)" >> subprojects/llvm/meson.build
    echo "endforeach" >> subprojects/llvm/meson.build
    echo "dep_llvm = declare_dependency(" >> subprojects/llvm/meson.build
    echo "   include_directories: include_directories(" >> subprojects/llvm/meson.build
    echo "      '$LLVM_PATH/llvm/include'," >> subprojects/llvm/meson.build
    echo "      '$LLVM_PATH/build/include'" >> subprojects/llvm/meson.build
    echo "   )," >> subprojects/llvm/meson.build
    echo "   dependencies: _deps," >> subprojects/llvm/meson.build
    echo "   version: '$LLVM_VERSION'," >> subprojects/llvm/meson.build
    echo ")" >> subprojects/llvm/meson.build

    mkdir build-mesa || true
    pushd build-mesa
    
    meson setup ..  -Dprefix=$PREFIX \
                    -Dbuildtype=release \
                    --cross-file $MESON_CROSS \
                    -Dosmesa=true \
                    -Dplatforms= \
                    -Dglx=disabled \
                    -Dgallium-drivers=llvmpipe \
                    -Dvulkan-drivers= \
                    -Dllvm=enabled \
                    -Dvalgrind=disabled \
                    -Dlibunwind=disabled \
                    -Dbuild-tests=false \
                    -Degl=disabled || exit 1
    popd
}

build() {
    pushd build-mesa
    ninja
    popd
}

install() {
    pushd build-mesa
    DESTDIR=$SYSROOT ninja install
    popd 
}
