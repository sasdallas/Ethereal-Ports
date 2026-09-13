#!/usr/bin/env bash

# bzip2 port is based on Bananymous' port
# https://github.com/Bananymous/banan-os/blob/main/ports/bzip2/build.sh

NAME="bzip2"
VERSION="1.0.8"
TARBALL_URL="https://sourceware.org/pub/bzip2/bzip2-$VERSION.tar.gz"

configure() {
    # bzip2 has no configure
    return
}

build() {
    make -j$NPROC CC=$CC  -f Makefile-libbz2_so || exit 1
}

install() {
    cp -v libbz2.so.$VERSION $SYSROOT/usr/lib/ || exit 1
	ln -svf libbz2.so.$VERSION $SYSROOT/usr/lib/libbz2.so || exit 1
	ln -svf libbz2.so.$VERSION $SYSROOT/usr/lib/libbz2.so.1 || exit 1
	ln -svf libbz2.so.$VERSION $SYSROOT/usr/lib/libbz2.so.1.0 || exit 1

	cp -v bzlib.h $SYSROOT/usr/include/ || exit 1

	cat > $SYSROOT/usr/lib/pkgconfig/bzip2.pc << EOF
prefix=/usr
exec_prefix=\${prefix}
bindir=\${exec_prefix}/bin
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: bzip2
Description: A file compression library
Version: $VERSION
Libs: -L\${libdir} -lbz2
Cflags: -I\${includedir}
EOF
}