# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit eutils python-r1 git-r3
DESCRIPTION="similarity digest hashing tool http://sdhash.org"
HOMEPAGE="https://github.com/sdhash/sdhash"

EGIT_REPO_URI="https://github.com/sdhash/sdhash"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"


RDEPEND="
dev-libs/protobuf
"

DEPEND="${RDEPEND}
	 dev-lang/swig
"


src_prepare() {

	sed -i -e 's/^\(DESTDIR\|PREFIX\)=/#\1=/g' Makefile
	sed -i -e 's@-I/usr/include/python2.7@$(PYTHON_CFLAGS)@g;s@-lpython2.7@$(PYTHON_LIBS)@g;s/with-python=python2/with-python=$(EPYTHON)/g' Makefile
	#sed -i -e 's/kEmptyString/GetEmptyStringAlreadyInited()/g' sdbf/blooms.pb.cc
	#sed -i -e 's/kEmptyString/GetEmptyStringAlreadyInited()/g' sdbf/blooms.pb.h
	protoc -I=. --cpp_out=sdbf blooms.proto
	default

	python_copy_sources
}

src_configure() {

	python_foreach_impl run_in_build_dir default
}

src_compile() {
	src_c(){
		python_export PYTHON_CFLAGS PYTHON_LIBS EPYTHON
		emake
		emake swig-py
		futurize -nw swig/python/test.py
		}
	python_foreach_impl run_in_build_dir src_c
}

src_test() {
	python_foreach_impl run_in_build_dir default
}
src_install() {
	src_i(){
		PREFIX=${EPREFIX}/usr emake install
		python_export PYTHON_SITEDIR EPYTHON
		mkdir -p ${D}${PYTHON_SITEDIR}/
		cp swig/python/_sdbf_class.so ${D}${PYTHON_SITEDIR}/ || die
		cp swig/python/sdbf_class.py ${D}${PYTHON_SITEDIR}/ || die
		cp swig/python/test.py ${D}${PYTHON_SITEDIR}/ || die
		python_fix_shebang ${D}${PYTHON_SITEDIR}/
		}
	python_foreach_impl run_in_build_dir src_i

}
