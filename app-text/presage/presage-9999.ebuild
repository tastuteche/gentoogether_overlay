# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit eutils autotools python-r1 git-r3
DESCRIPTION="The intelligent predictive text entry system"
HOMEPAGE="http://http://presage.sourceforge.net"

EGIT_REPO_URI="git://git.code.sf.net/p/presage/presage"

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


src_prepare() {
	sed -i -e 's@print distutils.sysconfig.get_python_inc();@print (distutils.sysconfig.get_python_inc());@g' m4/ac_python_devel.m4
	sed -i -e 's@print distutils.sysconfig.get_python_lib(0,0);@print (distutils.sysconfig.get_python_lib(0,0));@g' m4/ac_python_devel.m4
	sed -i -e 's@print distutils.sysconfig.get_python_inc();@print (distutils.sysconfig.get_python_inc());@g' configure.ac
	sed -i -e 's@^[ ]\{16\}@\t\t@g' -e 's@^\t[ ]\{8\}@\t\t@g' -e 's@^[ ]\{8\}@\t@g' bindings/python/presage_python_demo.in
	default
	eautoreconf

	python_copy_sources
}

src_configure() {

	#econf ${myeconfargs}


	configuring() {

		# epydoc is python2-only, bug #447642
		#local apidocs=--disable-api-docs
		#[[ ${EPYTHON/.*} = "python2" ]] && apidocs=$(use_enable doc api-docs)


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
		pushd bindings/python
		futurize -wn .
		futurize -wn presage_python_demo
		popd
		pushd apps/dbus
		futurize -wn .
		futurize -wn presage_dbus_python_demo
		popd

	}
	python_foreach_impl run_in_build_dir configuring
}

src_compile() {
	python_foreach_impl run_in_build_dir default
}

src_test() {
	python_foreach_impl run_in_build_dir default
}
src_install() {
	python_foreach_impl run_in_build_dir default
}
