#!/usr/bin/env bash

NAME="7zip"
VERSION="26.02"
TARBALL_URL="https://github.com/ip7z/7zip/archive/$VERSION/7zip-$VERSION.tar.gz"

configure() {
    return   
}

build() {
    (for i in Bundles/{Alone,Alone7z,Format7zF,SFXCon} UI/Console; do
        make -C CPP/7zip/$i -f ../../cmpl_gcc.mak -j$NPROC || exit 1
    done)
}

install() {
    PROG=$(which install)
    $PROG -vDm755 CPP/7zip/Bundles/Alone{/b/g/7za,7z/b/g/7zr} $SYSROOT/usr/lib/7zip/
    $PROG -vDm755  CPP/7zip/Bundles/Format7zF/b/g/7z.so $SYSROOT/usr/lib/7zip/
    $PROG -vDm755  CPP/7zip/UI/Console/b/g/7z $SYSROOT/usr/lib/7zip/
    $PROG -vm755 CPP/7zip/Bundles/SFXCon/b/g/7zCon $SYSROOT/usr/lib/7zip/7zCon.sfx

    for i in 7z 7za 7zr; do
        echo -e "#!/bin/sh\nexec /usr/lib/7zip/$i "\$@"" > $SYSROOT/usr/bin/$i
        chmod 755 $SYSROOT/usr/bin/$i
    done
}
