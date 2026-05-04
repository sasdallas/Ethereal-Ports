#!/usr/bin/env bash

# =================================================================
# build_port.sh
# takes in port as an argument and builds it fully using the port configuration
# =================================================================


if ! [ -n "$SYSROOT" ]; then
	echo "The \$SYSROOT environ must be set to build ports"
	echo "Please setup the Ethereal build environment through buildenv.sh"
	exit 1
fi

if ! [ -n "$TRIPLET" ]; then
	echo "The \$TRIPLET environ must be set to build ports"
	echo "Please setup the Ethereal build environment through buildenv.sh"
	exit 1
fi

set -eu

FORCE=0
BUILD_DEPS=1

while getopts ":f" opt; do
	case "$opt" in
		f)
			FORCE=1
			;;
		d)
			BUILD_DEPS=0
			;;
		?)
			echo "Usage: build_port.sh [-f] [-d] [port name]"
			exit 1
			;;
	esac
done

shift $((OPTIND - 1))

if [ $# -lt 1 ]; then
	echo "Usage: build_port.sh [-f] [-d] [port name]"
	exit 1
fi

PORT=$1

if ! [ -d $PORT ]; then
	echo "Port $PORT does not exist"
	exit 1
fi

# =================================================================
# PRETTY PRINTERS
# =================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
UNDER='\033[4m'
RESET='\033[0m'



_log() {
	local level="$1"; shift
	local color="$1"; shift
	local msg="$*"
	printf "%b %s %b\n" "${color}[${level}]${RESET}" "$msg"
}

info() {
	_log "INFO" "${BLUE}" "$*"
}

warn() {
	_log "WARN" "${YELLOW}" "$*" >&2
}

error() {
	_log "ERROR" "${RED}" "$*" >&2
}

success() {
	_log "OK" "${GREEN}" "$*"
}

step() {
	local msg="$*"
	printf "%b %s\n" "${CYAN}==>${RESET}" "$msg"
}

die() {
	local code=1
	if [ "$#" -gt 1 ] && [[ "$1" =~ ^[0-9]+$ ]]; then
		code="$1"; shift
	fi
	if [ "$#" -gt 0 ]; then
		error "$*"
	fi
	popd
	exit "$code"
}

export -f  info warn error success step die


# =================================================================
# DEPENDENCIES
# =================================================================

is_built() {
	local port="$1"
	grep -qxF "$port" .built_ports
}

build_dependencies() {
	set +u
	if ! [ -n "$DEPENDS" ]; then
		return
	fi
	set -u

	for dep in "${DEPENDS[@]}"; do
		if is_built $dep; then
			step "Already built dependency $dep, skipping"
			continue
		fi

		step "Building dependency $dep"
	    ./build_port.sh $dep
    done
}

# =================================================================
# FETCH
# =================================================================

fetch() {
	# If GIT_URL and GIT_COMMIT is defined then its a git.
	# If TARBALL_URL is defined then its a tarball
	set +u
	if [ -n "$GIT_URL" ]; then

		if [ -z "${BUILD_DIR:-}" ]; then
			BUILD_DIR="${GIT_URL%/}"
			BUILD_DIR="${BUILD_DIR##*/}"
			BUILD_DIR="${BUILD_DIR%.git}"
		fi

		set -u
	
		if [ -d "$BUILD_DIR" ]; then
			if [ "$FORCE" -eq 1 ]; then
				step "Removing existing build directory $BUILD_DIR"
				rm -rf -- "$BUILD_DIR"
			else
				# TODO better
				info "Build directory $BUILD_DIR already exists, assuming port is built."
				info "To rebuild port please delete dir."
				popd > /dev/null
				exit 0
			fi
		fi

		step "Cloning \"$GIT_URL\"..."

		git clone "$GIT_URL" "$BUILD_DIR"
		pushd $BUILD_DIR > /dev/null
		git checkout $GIT_COMMIT
		popd > /dev/null # will get pushed into later
	elif [ -n "$TARBALL_URL" ]; then
		step "Downloading $TARBALL_URL"

		# For tarballs the standard format is NAME-VERSION
		# If VERSION is not set then fail out (unless they specified a custom BUILD_DIR)
		if [ -z "${VERSION-}" ] &&  [ -z "${BUILD_DIR-}"]; then
			die "Port $PORT does not have the VERSION tag"
		fi

		: "${BUILD_DIR:=$NAME-$VERSION}"

		set -u

		if [ -d "$BUILD_DIR" ]; then
			if [ "$FORCE" -eq 1 ]; then
				step "Removing existing build directory $BUILD_DIR"

				# I hope this doesn't end up like that one Steam bug
				rm -rf -- "$BUILD_DIR"
			else
				# TODO better
				info "Build directory $BUILD_DIR already exists, assuming port is built."
				info "To rebuild port please delete dir or rerun script with -f option."
				popd > /dev/null
				exit 0
			fi
		fi


		archive="${TARBALL_URL##*/}"
		archive="${archive%%\?*}"

		if ! [ -f $archive ] || [ $FORCE -gt 0 ]; then
			rm $archive || true
			wget $TARBALL_URL
		fi

		tar -xf "$archive"

		if ! [ -d $BUILD_DIR ]; then
			die "$BUILD_DIR does not exist"
		fi
	else
		die "Unknown fetch method or no fetch method was provided for port $PORT"
	fi
}

# =================================================================
# PATCH APPLICATION
# =================================================================

pre_setup() {
	return
}

apply_patches() {
	local patches_dir="../patches"

	if ! [ -d "$patches_dir" ]; then
		info "No patches directory at $patches_dir"
		return
	fi

	# enable nullglob so the glob expands to empty when no files present
	shopt -s nullglob
	local patches=( "$patches_dir"/* )
	shopt -u nullglob

	if [ "${#patches[@]}" -eq 0 ]; then
		info "No patches to apply"
		return
	fi

	for p in "${patches[@]}"; do
		[ -f "$p" ] || continue
		local name=$(basename "$p")
		step "Applying patch ${name}"

		if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
			if git apply --index --whitespace=nowarn "$p"; then
				continue
			else
				warn "git apply failed for ${name}, trying patch -p1"
			fi
		fi

		if ! patch -p1 --forward < "$p"; then
			die "Failed to apply patch ${name}"
		fi
	done
}


# =================================================================
# CONFIGURATION
# =================================================================

pre_configure() {
	return
}

configure() {
	./configure --host=$TRIPLET --prefix=/usr
}


# =================================================================
# BUILD
# =================================================================

pre_build() {
	return
}

build() {
	make -j$NPROC all
}

# =================================================================
# INSTALL
# =================================================================

pre_install() {
	return
}

install() {
	make DESTDIR=$SYSROOT install	
}

# =================================================================
# MAIN
# =================================================================


NPROC=$(nproc)

if is_built $PORT && [ $FORCE -ne 1 ]; then
	info "This port was already built. Use the -f flag to rebuild it"
	exit 0
fi


source "$PORT/build.sh"

build_dependencies

pushd $PORT > /dev/null

fetch

# now we can actually build
pushd $BUILD_DIR > /dev/null

pre_setup
apply_patches
pre_configure
configure
pre_build
build
pre_install
install

popd > /dev/null

echo "$PORT" >> ../.built_ports

popd > /dev/null

