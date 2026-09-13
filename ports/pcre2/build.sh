#!/usr/bin/env bash

NAME="pcre2"
VERSION="10.45"
TARBALL_URL="https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$VERSION/pcre2-$VERSION.tar.gz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static
}

