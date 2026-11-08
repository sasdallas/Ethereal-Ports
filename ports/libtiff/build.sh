#!/usr/bin/env bash

NAME="libtiff"
VERSION="4.7.0"
TARBALL_URL="https://download.osgeo.org/libtiff/tiff-$VERSION.tar.gz"
BUILD_DIR="tiff-$VERSION"
DEPENDS=("zlib" "zstd" "libjpeg")

