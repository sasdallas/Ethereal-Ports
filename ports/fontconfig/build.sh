NAME="fontconfig"
VERSION="2.18.1"
TARBALL_URL="https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/$VERSION/fontconfig-$VERSION.tar.xz"
DEPENDS=("expat")

# technically this does depend on freetype

configure() {
    ac_cv_va_copy=yes ./configure --prefix=$PREFIX --sysconfdir=/etc --localstatedir=/var/ --disable-docs --host=$TRIPLET
}