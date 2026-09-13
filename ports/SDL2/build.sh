#!/usr/bin/env bash

# The SDL 2 port was made possible by Bananymous and banan-os.
# This includes the patches.
# Lots of love to his port (this is the last branch with SDL2):
# https://github.com/Bananymous/banan-os/blob/01f0871a836004a26b6276d710303bab52ebe9d1/ports/SDL2/

NAME="SDL2"
VERSION="2.30.11"
TARBALL_URL="https://github.com/libsdl-org/SDL/releases/download/release-$VERSION/SDL2-$VERSION.tar.gz"
DEPENDS=("libiconv")

SDL_GL_SETTING=ON
SDL_BUILD_DEBUG=0

if get_bool_option "SDL_NO_GL"; then
    info "Building SDL2 without GL support"
    SDL_GL_SETTING=OFF
else
    GL_BACKEND=$(get_option "SDL_GL_BACKEND" "mesa")
    
    info "Using GL backend $GL_BACKEND"
    DEPENDS+=($GL_BACKEND)
fi

if get_bool_option "SDL_DEBUG"; then
    info "Building SDL2 with debug support"
    SDL_BUILD_DEBUG=1
fi


configure() {
    mkdir build
    
    cmake   -S . -B build \
            --toolchain=${CMAKE_CROSS} \
            -DCMAKE_INSTALL_PREFIX=${PREFIX} \
            -DCMAKE_BUILD_TYPE=$([[ $SDL_BUILD_DEBUG == 1 ]] && echo "Debug" || echo "Release") \
            -DSDL_LIBSAMPLERATE=OFF \
            -DSDL_STATIC=OFF \
            -DSDL_OPENGL=$SDL_GL_SETTING \
            || exit 1
}

build() {
    cmake --build build -j$NPROC || exit 1
}

install() {
    cmake --install build || exit 1

    if [[ $SDL_BUILD_DEBUG -eq 1 ]]; then
        step Finishing debug build
        ln -sf libSDL2d.so ${SYSROOT}/usr/lib/libSDL2.so
        ln -sf libSDL2d-2.0.so ${SYSROOT}/usr/lib/libSDL2-2.0.so
    fi
}
