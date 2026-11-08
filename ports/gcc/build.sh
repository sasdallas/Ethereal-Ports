#!/usr/bin/env bash

NAME="gcc"
VERSION="14.2.0"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/gcc/gcc-$VERSION/gcc-$VERSION.tar.gz"
DEPENDS=("gmp" "mpfr" "mpc")

pre_configure() {
    sed -i 's/if (madvise (mapping, hdr.pos, MADV_RANDOM))/if (0)/; s/if (madvise (reinterpret_cast <char \*> (mapping), size, MADV_RANDOM))/if (0)/' gcc/cp/module.cc

    # reconfigure libstdc++-v3 to get target in. requires the correct version of autoconf
    pushd libstdc++-v3
    autoconf || exit 1
    popd
}

configure() {
    mkdir build-gcc || true
    pushd build-gcc
    (
        unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS LIBS
        ac_cv_func_madvise=no ../configure --host=$TRIPLET --target=$TRIPLET --prefix=$PREFIX --enable-shared --enable-languages=c,c++ --disable-werror --disable-multilib --enable-shared --enable-host-shared --with-pic || exit 1
    ) || exit 1
    popd
}

build() {
    pushd build-gcc
    make CFLAGS_FOR_TARGET="-Wno-error=implicit-function-declaration" -j$NPROC all-gcc all-target-libgcc all-target-libstdc++-v3 || exit 1
    popd
}

install() {
    pushd build-gcc
    make DESTDIR=$SYSROOT -j$NPROC install-strip-gcc install-strip-target-libgcc install-strip-target-libstdc++-v3 || exit 1
    popd
}
