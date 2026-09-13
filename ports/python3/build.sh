NAME="python3"
VERSION="3.14.6"
TARBALL_URL="https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tar.xz"
BUILD_DIR="Python-$VERSION"
DEPENDS=("ncurses" "zlib" "openssl")

configure() {
    ./configure --host=x86_64-ethereal --prefix=/usr --build=x86_64 --disable-ipv6 --enable-shared --with-build-python=python3 ac_cv_file__dev_ptmx=no ac_cv_file__dev_ptc=no --disable-test-modules --enable-shared --without-ensurepip
}

