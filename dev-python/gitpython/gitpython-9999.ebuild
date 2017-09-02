# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

EGIT_REPO_URI="https://github.com/gitpython-developers/GitPython"

inherit git-r3 distutils-r1

DESCRIPTION="GitPython is a python library used to interact with Git repositories. http://gitpython.readthedocs.org"
HOMEPAGE="GitPython is a python library used to interact with Git repositories. http://gitpython.readthedocs.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/gitdb2[${PYTHON_USEDEP}]
dev-python/ddt[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
