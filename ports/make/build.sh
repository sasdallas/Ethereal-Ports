NAME="make"
VERSION="4.4.1"
TARBALL_URL="https://ftpmirror.gnu.org/gnu/make/make-$VERSION.tar.gz"

configure() {
    CFLAGS="-std=c17" ./configure --host=x86_64-ethereal --prefix=/usr --with-sysroot=/ --disable-nls --disable-posix-spawn --enable-year2038
}
