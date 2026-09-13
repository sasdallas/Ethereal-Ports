#!/usr/bin/env bash

NAME="libsndfile"
VERSION="1.2.2"
TARBALL_URL="https://github.com/libsndfile/libsndfile/releases/download/$VERSION/libsndfile-$VERSION.tar.xz"

configure() {
    CFLAGS=-std=c11 ./configure --host=$TRIPLET --prefix=$PREFIX
}