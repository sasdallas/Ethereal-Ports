#!/usr/bin/env bash

NAME="libisoburn"
VERSION="1.5.6"
TARBALL_URL="https://files.libburnia-project.org/releases/libisoburn-$VERSION.tar.gz"
DEPENDS=("libburn" "libisofs")

configure() {
    ./configure --host=x86_64-ethereal --prefix=/usr --with-sysroot=$SYSROOT --enable-pkg-check-modules
}
