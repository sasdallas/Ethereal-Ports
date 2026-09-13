NAME="unzip"
VERSION="60"
TARBALL_URL=" https://downloads.sourceforge.net/infozip/unzip$VERSION.tar.gz"
BUILD_DIR="unzip$VERSION"

configure() {
    return
}

build() {
    make -f unix/Makefile generic1 \
		CC=$CC \
		LD=$CC \
		AS=$AS \
		CF="-O2 -I. -include utime.h -DUNIX -DSYSV -DMODERN -DGOT_UTIMBUF -DNO_LCHMOD" \
		LF2=""
}

install() {

	make -f unix/Makefile install \
		prefix=$PREFIX \
		BINDIR=$SYSROOT$PREFIX/bin \
		MANDIR=$SYSROOT$PREFIX/share/man/man1
}