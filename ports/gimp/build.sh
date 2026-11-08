#!/usr/bin/env bash

NAME="gimp"
VERSION="3.2.6"
TARBALL_URL="https://download.gimp.org/gimp/v${VERSION%.*}/gimp-$VERSION.tar.xz"
DEPENDS=("appstream" "gegl" "gexiv2" "glib-networking" "gtk3" "harfbuzz" "libmypaint" "librsvg" "libtiff" "lcms2" "libxml2" "mypaint-brushes" "poppler" "xz" "libjpeg")

pre_configure() {
    patch -Np1 -i build/macos/patches/0001-build-macos-Do-not-require-gexiv2-0.14-on-homebrew.patch
}

configure() {
    mkdir build-gimp
    (
        unset PKG_CONFIG_DIR PKG_CONFIG_SYSROOT_DIR PKG_CONFIG_LIBDIR PKG_CONFIG_PATH
    pushd build-gimp
    meson setup .. --cross-file $MESON_CROSS -Dprefix=$PREFIX --reconfigure -Dshmem-type=none -Dlibunwind=false -Dlibbacktrace=false -Dbash-completion=disabled || exit 1
    popd
    ) || exit 1
}

build() {
    pushd build-gimp
    ninja || exit 1
    popd
}

install() {
    pushd build-gimp
    DESTDIR=$SYSROOT ninja install || exit 1
    popd
}
