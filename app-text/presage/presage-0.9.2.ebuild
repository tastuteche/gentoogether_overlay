# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )
my_pv=0.9.2~beta
my_p=presage-0.9.2~beta20150909

inherit eutils autotools python-single-r1
DESCRIPTION="The intelligent predictive text entry system"
HOMEPAGE="http://http://presage.sourceforge.net"
SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${my_pv}/${my_p}.tar.gz"
#https://phoenixnap.dl.sourceforge.net/project/presage/presage/0.9.2~beta/presage-0.9.2~beta20150909.tar.gz

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples gtk python sqlite test"

RDEPEND="
	app-text/dos2unix
	examples? ( sys-libs/ncurses )
	gtk? ( x11-libs/gtk+:2 )
	python? ( dev-lang/python dev-python/dbus-python )
	sqlite? ( dev-db/sqlite:3 )
"

DEPEND="${RDEPEND}
	sys-apps/help2man
	doc? ( app-doc/doxygen )
	python? ( dev-lang/swig )
	test? ( dev-util/cppunit )
"

pkg_setup() {
	python-single-r1_pkg_setup
}
S=${WORKDIR}/presage-0.9.2~beta

src_prepare() {
	epatch "${FILESDIR}/${PN}-0.9.2-charsets.patch"
	cp "${FILESDIR}/"org.gnome.presage.service.in ${S}/apps/dbus/
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_enable doc documentation)
		$(use_enable examples curses)
		$(use_enable gtk gpresagemate)
		$(use_enable gtk gprompter)
		$(use_enable python)
		$(use_enable python python-binding)
		$(use_enable sqlite)
		$(use_enable test)
	)
	econf ${myeconfargs}
}
