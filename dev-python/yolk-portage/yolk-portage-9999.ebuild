# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="Gentoo Portage plugin for yolk"
HOMEPAGE="https://pypi.python.org/pypi/yolk-portage"
EGIT_REPO_URI="https://github.com/tastuteche/yolk-portage-py3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=app-portage/portage-utils-0.1.23"
