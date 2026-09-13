NAME="openssh"
VERSION="10.0p1"
TARBALL_URL="https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$VERSION.tar.gz"
DEPENDS=("zlib" "openssl")

configure() {
    CFLAGS=-Wno-deprecated-declarations ./configure --host=x86_64-ethereal --prefix=/usr --sbindir=/usr/bin/ --sysconfdir=/etc --disable-fd-passing --disable-utmpx --disable-utmp
}

pre_build() {
    sed -i 's/#define HAVE_ADDR_IN_UTMPX .*/#undef HAVE_ADDR_IN_UTMPX/' config.h
    sed -i 's/#define HAVE_ADDR_V6_IN_UTMPX .*/#undef HAVE_ADDR_V6_IN_UTMPX/' config.h
}

finish_install() {
    # sourced: https://github.com/Bananymous/banan-os/blob/main/ports/openssh/build.sh
	passwd="$SYSROOT/etc/passwd"
	test "$(tail -c 1 "$passwd")" && echo >> $passwd
	grep -q '^sshd:' "$passwd" || echo 'sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/bin/nologin' >> "$passwd"
}
