NAME="vim"
VERSION="9.2.0538"
TARBALL_URL="https://github.com/vim/vim/archive/refs/tags/v$VERSION.tar.gz"
DEPENDS=("ncurses")

configure() {
    ./configure --with-tlib=ncurses \
                --host=x86_64-ethereal \
                --prefix=/usr \
                --disable-nls \
                vim_cv_toupper_broken=no \
                vim_cv_terminfo=yes \
                vim_cv_tgetent=yes \
                vim_cv_getcwd_broken=no \
                vim_cv_timer_create_works=no \
                vim_cv_stat_ignores_slash=yes \
                vim_cv_memmove_handles_overlap=yes
}
