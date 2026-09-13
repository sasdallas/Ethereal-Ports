#!/usr/bin/env bash

NAME="SDL_mixer"
VERSION="1.2.12"
TARBALL_URL="https://github.com/libsdl-org/SDL_mixer/archive/refs/tags/release-$VERSION.tar.gz"
BUILD_DIR="SDL_mixer-release-$VERSION"
DEPENDS=("sdl12-compat" "libmikmod" "libiconv")
