# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
#CMAKE_MAKEFILE_GENERATOR="ninja"

inherit cmake-utils python-r1

DESCRIPTION="TLSH - Trend Micro Locality Sensitive Hash"
HOMEPAGE="https://github.com/trendmicro/tlsh"

MY_PN="${PN//+/p}"
if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="https://github.com/trendmicro/tlsh"
	inherit git-r3
else
	SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-macos"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"

src_configure() {
	python_foreach_impl cmake-utils_src_configure
}

src_compile() {
	python_foreach_impl cmake-utils_src_make
}

src_test() {
	python_foreach_impl cmake-utils_src_test
}

src_install() {
	src_install_internal() {
		cmake-utils_src_install
		pushd py_ext
		${EPYTHON} setup.py install --root="${D%/}"
		popd
	}
	python_foreach_impl src_install_internal
}
#find /r/a/p/usr/portage -name '*.ebuild' | xargs -n1 grep -l 'cmake' |xargs -n1 grep -l 'python-r1'
