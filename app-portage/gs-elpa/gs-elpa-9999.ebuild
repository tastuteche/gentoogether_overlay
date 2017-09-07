# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python{2_7,3_4,3_5})

inherit distutils-r1 git-r3 prefix

DESCRIPTION="g-sorcery backend for elisp packages"
HOMEPAGE="https://github.com/jauhien/gs-elpa"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/tastuteche/gs-elpa"

LICENSE="GPL-2"
SLOT="0"

DEPEND=">=app-portage/g-sorcery-9999[$(python_gen_usedep 'python*')]
	dev-python/sexpdata[$(python_gen_usedep 'python*')]"
RDEPEND="${DEPEND}"

python_prepare_all()  {
	distutils-r1_python_prepare_all
	eprefixify setup.py
}

python_install_all() {
	distutils-r1_python_install_all
	doman docs/*.8
}
