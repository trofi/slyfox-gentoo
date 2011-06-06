# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libtorrent/libtorrent-0.12.7.ebuild,v 1.3 2011/04/13 21:30:46 sochotnicky Exp $

EAPI=2
inherit autotools eutils libtool subversion toolchain-funcs

DESCRIPTION="BitTorrent library written in C++ for *nix"
HOMEPAGE="http://libtorrent.rakshasa.no/"
#SRC_URI="http://libtorrent.rakshasa.no/downloads/${P}.tar.gz"
ESVN_REPO_URI="svn://rakshasa.no/libtorrent/trunk/libtorrent"
ESVN_PROJECT="libtorrent"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug ipv6 ssl"

RDEPEND=">=dev-libs/libsigc++-2.2.2:2
	ssl? ( dev-libs/openssl )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/cppunit"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.12.7-test.patch
	epatch "${FILESDIR}"/download_constructor.diff
	epatch "${FILESDIR}"/${PN}-9999-test-fix-gcc4.5.patch
	epatch "${FILESDIR}"/${PN}-9999-ticket-1263-unaligned-access.patch
	./autogen.sh
	elibtoolize
}

src_configure() {
	# the configure check for posix_fallocate is wrong.
	# reported upstream as Ticket 2416.
	local myconf
	echo "int main(){return posix_fallocate();}" > "${T}"/posix_fallocate.c
	if $(tc-getCC) ${CFLAGS} ${LDFLAGS} "${T}"/posix_fallocate.c -o /dev/null 2>/dev/null ; then
		myconf="--with-posix-fallocate"
	else
		myconf="--without-posix-fallocate"
	fi

	econf \
		--disable-dependency-tracking \
		--enable-aligned \
		$(use_enable debug) \
		$(use_enable ipv6) \
		$(use_enable ssl openssl) \
		${myconf}
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS NEWS README
}