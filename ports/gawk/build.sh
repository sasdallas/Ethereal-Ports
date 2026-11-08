#!/usr/bin/env bash

NAME="gawk"
VERSION="5.2.2"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/gawk/gawk-$VERSION.tar.xz"

configure() {
	./configure --host=$TRIPLET --prefix=$PREFIX --disable-nls --disable-extensions

    # disable all test
	echo "all:" > test/Makefile
	echo "	echo ignore" >> test/Makefile
	echo "install:" >> test/Makefile
	echo "	echo ignore" >> test/Makefile
}
