NAME="libICE"
VERSION="1.1.2"
TARBALL_URL="https://www.x.org/pub/individual/lib/libICE-$VERSION.tar.xz"
DEPENDS_ON=("libX11")

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --enable-shared
}
