# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="Tool and library for querying PyPI and locally installed Python packages"
HOMEPAGE="https://pypi.python.org/pypi/yolk"
EGIT_REPO_URI="https://github.com/tastuteche/yolk-py3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples"

DEPEND="dev-python/setuptools
	>=dev-python/yolk-portage-9999"
RDEPEND="${DEPEND}"

python_install_all() {
	if use examples; then
		docinto examples/plugins
		dodoc -r examples/plugins/*
	fi
}
