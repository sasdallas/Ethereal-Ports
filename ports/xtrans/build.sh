NAME="xtrans"
VERSION="1.6.0"
TARBALL_URL="https://www.x.org/pub/individual/lib/xtrans-$VERSION.tar.xz"

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --enable-shared
}
