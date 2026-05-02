#!/bin/sh

if ! [ -n "$SYSROOT" ]; then
	echo "The \$SYSROOT environ must be set to build this port"
	exit 1
fi

set -e
git clone https://github.com/ozkl/doomgeneric
cd doomgeneric
git apply ../patches/0001-Add_ethereal_support.patch
cd doomgeneric
make all
cp doomgeneric $SYSROOT/usr/bin/
cd ../../
