# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# add python3, maybe not work!
PYTHON_COMPAT=( python2_7 python{3_3,3_4,3_5} )

inherit git-r3 distutils-r1

DESCRIPTION="Python refactoring library"
HOMEPAGE="https://github.com/python-rope/rope"
EGIT_REPO_URI="https://github.com/python-rope/rope"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc"

# Dependency for docbuild documentation which is not noted in
# setup.py, using standard docutils builds docs successfully.
DEPEND="doc? ( dev-python/docutils[${PYTHON_USEDEP}] )"

#PATCHES=( "${FILESDIR}/${P}-doc-syntax-errors.patch" )

python_test() {
	PYTHONPATH="${BUILD_DIR}/lib:." ${EPYTHON} ropetest/__init__.py
}

python_compile_all() {
	local i;
	if use doc; then
		pushd docs > /dev/null
		mkdir build || die
		for i in ./*.rst
		do
			rst2html.py $i > ./build/${i/rst/html} || die
		done
	   	popd > /dev/null
	fi
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/. )
	distutils-r1_python_install_all
}
