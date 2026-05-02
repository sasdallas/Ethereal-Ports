#!/bin/sh

if ! [ -n "$SYSROOT" ]; then
	echo "The \$SYSROOT environ must be set to build this port"
	exit 1
fi

if ! [ -n "$TRIPLET" ]; then
	echo "The \$TRIPLET environ must be set to build this port"
	exit 1
fi

set -e
git clone https://github.com/TinyCC/tinycc
cd tinycc

git apply ../patches/0001-Add_ethereal_support.patch

# thanks to tayoky for figuring out the configs
./configure --targetos=ethereal --enable-static --sysroot=$SYSROOT --prefix=/usr --cc=$CC --triplet=$TRIPLET --elfinterp=/usr/lib/ld.so --libpaths=/usr/lib:/usr/lib/tcc --sysincludepaths=/usr/include:/usr/lib/tcc/include/ --crtprefix=/usr/lib

make XTCC=gcc XAR=ar all
make DESTDIR=$SYSROOT install
cd ../../
