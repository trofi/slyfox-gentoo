# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic multilib-minimal multiprocessing autotools git-r3

DESCRIPTION="sandbox'd LD_PRELOAD hack"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Sandbox"
EGIT_REPO_URI="https://anongit.gentoo.org/git/proj/sandbox.git"
#SRC_URI="https://dev.gentoo.org/~slyfox/distfiles/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"
IUSE="test"

RESTRICT="!test? ( test )"

DEPEND="
	app-arch/xz-utils
	>=app-misc/pax-utils-0.1.19
	test? ( dev-libs/libsigsegv )
"
RDEPEND=""

has sandbox_death_notice ${EBUILD_DEATH_HOOKS} || EBUILD_DEATH_HOOKS="${EBUILD_DEATH_HOOKS} sandbox_death_notice"

src_prepare() {
	default

	eautoreconf

	# live ebuild autogenerates test name,
	# does not know how to read them locally
	multilib_copy_sources
}

sandbox_death_notice() {
	ewarn "If configure failed with a 'cannot run C compiled programs' error, try this:"
	ewarn "FEATURES='-sandbox -usersandbox' emerge sandbox"
}

multilib_src_configure() {
	filter-lfs-flags #90228

	econf
}

multilib_src_test() {
	# Default sandbox build will run with --jobs set to # cpus.
	emake -j1 check TESTSUITEFLAGS="--jobs=$(makeopts_jobs)"
}

multilib_src_install_all() {
	doenvd "${FILESDIR}"/09sandbox

	keepdir /var/log/sandbox
	fowners root:portage /var/log/sandbox
	fperms 0770 /var/log/sandbox

	dodoc AUTHORS ChangeLog* NEWS README
}

pkg_preinst() {
	chown root:portage "${ED}"/var/log/sandbox
	chmod 0770 "${ED}"/var/log/sandbox

	local v
	for v in ${REPLACING_VERSIONS}; do
		# 1.x was removed from ::gentoo in 2016
		if [[ ${v} == 1.* ]] ; then
			local old=$(find "${EROOT}"/lib* -maxdepth 1 -name 'libsandbox*')
			if [[ -n ${old} ]] ; then
				elog "Removing old sandbox libraries for you:"
				find "${EROOT}"/lib* -maxdepth 1 -name 'libsandbox*' -print -delete
			fi
		fi
	done
}

pkg_postinst() {
	local v
	for v in ${REPLACING_VERSIONS}; do
		# 1.x was removed from ::gentoo in 2016
		if [[ ${v} == 1.* ]] ; then
			chmod 0755 "${EROOT}"/etc/sandbox.d #265376
		fi
	done
}
