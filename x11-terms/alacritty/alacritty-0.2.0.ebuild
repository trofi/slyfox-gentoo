# Copyright 2017-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.1.6-pre

EAPI=6

# skipping: alacritty
CRATES="
aho-corasick-0.6.4
android_glue-0.2.3
ansi_term-0.11.0
approx-0.1.1
arraydeque-0.4.2
atty-0.2.10
base64-0.9.2
bitflags-0.4.0
bitflags-0.7.0
bitflags-0.8.2
bitflags-1.0.3
block-0.1.6
byteorder-1.2.3
bytes-0.3.0
cc-1.0.17
cfg-if-0.1.3
cgl-0.2.2
cgmath-0.16.1
clap-2.31.2
cmake-0.1.31
cocoa-0.15.0
copypasta-0.0.1
core-foundation-0.5.1
core-foundation-0.6.0
core-foundation-sys-0.5.1
core-foundation-sys-0.6.0
core-graphics-0.13.0
core-graphics-0.14.0
core-text-9.2.0
dlib-0.4.1
downcast-rs-1.0.3
dtoa-0.4.2
env_logger-0.5.10
errno-0.2.3
euclid-0.17.3
expat-sys-2.1.5
filetime-0.1.15
fnv-1.0.6
font-0.1.0
foreign-types-0.3.2
foreign-types-shared-0.1.1
freetype-rs-0.13.0
freetype-sys-0.4.0
fsevent-0.2.17
fsevent-sys-0.1.6
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
gl_generator-0.9.0
gleam-0.5.1
glutin-0.16.0
humantime-1.1.1
inotify-0.3.0
iovec-0.1.2
itoa-0.4.1
kernel32-sys-0.2.2
khronos_api-2.2.0
lazy_static-1.0.1
lazycell-0.4.0
lazycell-0.6.0
libc-0.2.42
libloading-0.5.0
libz-sys-1.0.18
linked-hash-map-0.5.1
log-0.3.9
log-0.4.2
malloc_buf-0.0.6
memchr-2.0.1
memmap-0.6.2
mio-0.5.1
mio-0.6.14
mio-more-0.1.0
miow-0.1.5
miow-0.2.1
net2-0.2.32
nix-0.11.0
nix-0.5.1
notify-4.0.3
num-traits-0.1.43
num-traits-0.2.4
objc-0.2.2
objc-foundation-0.1.1
objc_id-0.1.0
osmesa-sys-0.1.2
owning_ref-0.3.3
parking_lot-0.5.5
parking_lot_core-0.2.14
percent-encoding-1.0.1
pkg-config-0.3.11
proc-macro2-0.4.6
quick-error-1.2.2
quote-0.6.3
rand-0.4.2
redox_syscall-0.1.40
redox_termios-0.1.1
regex-1.0.0
regex-syntax-0.6.1
remove_dir_all-0.5.1
safemem-0.2.0
same-file-1.0.2
serde-1.0.66
serde_derive-1.0.66
serde_json-1.0.20
serde_yaml-0.7.5
servo-fontconfig-0.4.0
servo-fontconfig-sys-4.0.3
shared_library-0.1.8
slab-0.1.3
slab-0.3.0
slab-0.4.0
smallvec-0.6.1
smithay-client-toolkit-0.2.3
stable_deref_trait-1.1.0
static_assertions-0.2.5
strsim-0.7.0
syn-0.14.2
tempfile-3.0.2
termcolor-0.3.6
termion-1.5.1
textwrap-0.9.0
thread_local-0.3.5
time-0.1.40
ucd-util-0.1.1
unicode-width-0.1.5
unicode-xid-0.1.0
unreachable-1.0.0
utf8-ranges-1.0.0
utf8parse-0.1.0
vcpkg-0.2.3
vec_map-0.8.1
void-1.0.2
vte-0.3.2
walkdir-2.1.4
wayland-client-0.20.10
wayland-commons-0.20.10
wayland-protocols-0.20.10
wayland-scanner-0.20.10
wayland-sys-0.20.10
winapi-0.2.8
winapi-0.3.5
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-0.1.6
winit-0.15.1
ws2_32-sys-0.2.1
x11-dl-2.18.0
xdg-2.1.0
xml-rs-0.7.0
yaml-rust-0.4.0
"

inherit eutils cargo git-r3

DESCRIPTION="GPU-accelerated terminal emulator"
HOMEPAGE="https://github.com/jwilm/alacritty"
EGIT_REPO_URI="https://github.com/jwilm/alacritty"
EGIT_COMMIT="7f2b398ad2084bdaaa266e8da770a213f0a9a2eb"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	media-libs/freetype:2=
	media-libs/fontconfig:1.0=
	sys-libs/zlib:0=

	x11-libs/libX11:0=
	x11-libs/libXxf86vm:0=
	x11-libs/libXi:0=
	media-libs/mesa:0=

	x11-misc/xclip
"
DEPEND="${RDEPEND}
	dev-util/cmake
	virtual/pkgconfig
"

src_unpack() {
	git-r3_src_unpack
	cargo_src_unpack
}

src_install() {
	cargo_src_install
	make_desktop_entry ${PN} Alacritty utilities-terminal \
		"System;TerminalEmulator"
}
