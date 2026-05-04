if [ $# -lt 2 ]; then
    echo "Usage: buildenv.sh [SYSROOT] [ARCH]"
    echo "Sysroot should be <ETHEREAL DIR>/build-output/sysroot/"
    exit 1
fi

export SYSROOT=$1
export ARCH=$2

export TRIPLET=$ARCH-ethereal


export CC=$TRIPLET-gcc
export CXX=$TRIPLET-g++
export LD=$TRIPLET-ld
export AS=$TRIPLET-as
export AR=$TRIPLET-ar

export PREFIX="/usr"
export TARGET=$TRIPLET

export PKG_CONFIG_DIR=''
export PKG_CONFIG_LIBDIR=$SYSROOT/usr/lib/pkgconfig
export PKG_CONFIG_PATH=$SYSROOT/usr/share/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=$SYSROOT

