# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.1.3

EAPI=6

# skipping: alacritty
CRATES="
android_glue-0.2.2
ansi_term-0.9.0
arraydeque-0.2.3
atty-0.2.2
bitflags-0.3.3
bitflags-0.4.0
bitflags-0.7.0
bitflags-0.8.2
block-0.1.6
byteorder-0.5.3
bytes-0.3.0
cfg-if-0.1.0
cgl-0.1.5
cgmath-0.7.0
clap-2.24.2
clippy-0.0.104
clippy_lints-0.0.104
cmake-0.1.24
cocoa-0.3.3
copypasta-0.0.1
core-foundation-0.2.3
core-foundation-0.3.0
core-foundation-sys-0.2.3
core-foundation-sys-0.3.1
core-graphics-0.3.2
core-graphics-0.8.1
core-text-5.0.0
crossbeam-0.2.10
dlib-0.3.1
dtoa-0.4.1
dwmapi-sys-0.1.0
errno-0.2.3
euclid-0.12.0
expat-sys-2.1.4
filetime-0.1.10
fnv-1.0.5
font-0.1.0
foreign-types-0.2.0
freetype-rs-0.13.0
freetype-sys-0.4.0
fs2-0.2.5
fsevent-0.2.16
fsevent-sys-0.1.6
gcc-0.3.49
gdi32-sys-0.1.1
gl_generator-0.5.3
gleam-0.2.32
glutin-0.6.1
half-1.0.0
heapsize-0.3.9
inotify-0.2.3
itoa-0.3.1
kernel32-sys-0.2.2
khronos_api-1.0.1
lazy_static-0.1.16
lazy_static-0.2.8
lazycell-0.4.0
libc-0.2.23
libloading-0.3.4
libz-sys-1.0.13
linked-hash-map-0.3.0
log-0.3.8
malloc_buf-0.0.6
matches-0.1.4
memmap-0.2.3
mio-0.5.1
mio-0.6.2
miow-0.1.5
net2-0.2.29
nix-0.5.1
nix-0.7.0
nodrop-0.1.9
nom-1.2.4
notify-2.6.3
num-0.1.37
num-bigint-0.1.37
num-complex-0.1.37
num-integer-0.1.34
num-iter-0.1.33
num-rational-0.1.36
num-traits-0.1.37
objc-0.2.2
objc-foundation-0.1.1
objc_id-0.1.0
odds-0.2.25
osmesa-sys-0.1.2
owning_ref-0.2.4
parking_lot-0.3.8
parking_lot_core-0.2.2
phf-0.7.21
phf_codegen-0.7.21
phf_generator-0.7.21
phf_shared-0.7.21
pkg-config-0.3.9
quine-mc_cluskey-0.2.4
quote-0.3.15
rand-0.3.15
redox_syscall-0.1.17
regex-syntax-0.3.9
rustc-serialize-0.3.24
rustc_version-0.1.7
semver-0.1.20
semver-0.2.3
serde-0.7.15
serde-0.9.15
serde_codegen_internals-0.14.2
serde_derive-0.9.15
serde_json-0.9.10
serde_yaml-0.6.2
servo-fontconfig-0.2.0
servo-fontconfig-sys-2.11.3
shared_library-0.1.5
shell32-sys-0.1.1
siphasher-0.2.2
slab-0.1.3
slab-0.3.0
smallvec-0.4.0
strsim-0.6.0
syn-0.11.11
synom-0.11.3
target_build_utils-0.3.1
tempfile-2.1.5
term_size-0.3.0
thread-id-3.1.0
time-0.1.37
toml-0.1.30
unicode-normalization-0.1.4
unicode-segmentation-1.2.0
unicode-width-0.1.4
unicode-xid-0.0.4
user32-sys-0.1.2
utf8parse-0.1.0
vec_map-0.8.0
void-1.0.2
vte-0.3.1
walkdir-0.1.8
wayland-client-0.5.12
wayland-kbd-0.3.6
wayland-scanner-0.5.11
wayland-sys-0.5.11
wayland-window-0.2.3
winapi-0.2.8
winapi-build-0.1.1
ws2_32-sys-0.2.1
x11-dl-2.14.0
xdg-2.1.0
xml-rs-0.3.6
yaml-rust-0.3.5
"

inherit eutils cargo git-r3

DESCRIPTION="GPU-accelerated terminal emulator"
HOMEPAGE="https://github.com/jwilm/alacritty"
EGIT_REPO_URI="https://github.com/jwilm/alacritty"
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
