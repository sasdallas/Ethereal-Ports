NAME="libX11"
VERSION="1.8.13"
TARBALL_URL="https://www.x.org/pub/individual/lib/libX11-$VERSION.tar.xz"
DEPENDS=("xorgproto" "xtrans" "libxcb")

configure() {
    ./configure --host=$TRIPLET --prefix=$PREFIX --disable-static --enable-shared --disable-malloc0returnsnull
}
