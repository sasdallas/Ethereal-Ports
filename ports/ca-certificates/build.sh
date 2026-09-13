#!/usr/bin/env bash

NAME="ca-certificates"
VERSION="2026-03-19"
DOWNLOAD_URL="https://curl.se/ca/cacert-$VERSION.pem"
BUILD_DIR="."

fetch() {
    wget $DOWNLOAD_URL
}

configure() {
    return
}

build() {
    return
}

install() {
    # sourced from banan-os
    rm -rf "$SYSROOT/etc/cacert/extracted"
    mkdir -p "$SYSROOT/etc/cacert/extracted"
    
    cp -vf "cacert-$VERSION.pem" "$SYSROOT/etc/cacert/extracted/cacert.pem"
    awk '/-----BEGIN CERTIFICATE-----/ {c=1;n++} c {print > sprintf("cert%03d.pem", n)} /-----END CERTIFICATE-----/ {c=0}' "cacert-$VERSION.pem"
    mv cert*.pem "$SYSROOT/etc/cacert/extracted/"
}
