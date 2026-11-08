#!/usr/bin/env bash

NAME="git"
VERSION="2.48.1"
TARBALL_URL="https://www.kernel.org/pub/software/scm/git/git-$VERSION.tar.xz"
DEPENDS=("pcre2" "curl" "openssl" "libiconv")

configure() {

    ac_cv_fread_reads_directories=no \
    ac_cv_iconv_omits_bom=no \
    ac_cv_lib_curl_curl_global_init=yes \
    ac_cv_snprintf_returns_bogus=no \
    ./configure --host=$TRIPLET --prefix=$PREFIX \
        --with-gitconfig=/etc/gitconfig \
        --with-python=python3 \
        --with-libpcre2 || exit 1
}
