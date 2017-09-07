# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/tastuteche/g-pypi-py3"

EGIT_BRANCH="master"
unset SRC_URI

DESCRIPTION="Manages ebuilds using information from Python Package Index"
HOMEPAGE="https://github.com/iElectric/g-pypi"
LICENSE="BSD-2"
KEYWORDS=""
SLOT="0"
IUSE="doc test"

DEPEND="
	dev-python/setuptools
	doc? (
		dev-python/sphinx
	)
	test? (
		dev-python/mock
		dev-python/mocker
		dev-python/scripttest
	)
"
# dev-python/unittest2 may not be necessary, bug #450648
#	app-portage/gentoolkit-dev
RDEPEND="
	app-portage/gentoolkit
	>=app-portage/metagen-9999
	>=dev-python/jaxml-9999
	dev-python/setuptools
	dev-python/jinja
	dev-python/pygments
	dev-python/sphinxcontrib-googleanalytics
	dev-python/unittest2
	>=dev-python/yolk-9999
"

src_prepare() {
	distutils-r1_src_prepare
	sed -e "s:'argparse',::" -i setup.py || die
}

src_compile() {
	distutils-r1_src_compile
	use doc && emake -C docs html
}

src_install() {
	distutils-r1_src_install
	use doc && dohtml -r docs/build/html/*
}
