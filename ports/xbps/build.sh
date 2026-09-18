#!/usr/bin/env bash

NAME="xbps"
VERSION="0.60.7"
TARBALL_URL="https://github.com/void-linux/xbps/archive/refs/tags/$VERSION.tar.gz"
DEPENDS=("libarchive" "openssl")

pre_install() {
	echo 'repository=https://package.ethereal-os.org/current' > data/repod-main.conf

	rm data/*.plist
	cp $PORT_UTIL_DIR/*.plist data/
}
