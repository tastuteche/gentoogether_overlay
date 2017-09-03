# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

EGIT_REPO_URI="https://github.com/myint/${PN}"

inherit git-r3 distutils-r1

DESCRIPTION="Formats Python code to follow a consistent style https://pypi.python.org/pypi/pyformat"
HOMEPAGE="Formats Python code to follow a consistent style https://pypi.python.org/pypi/pyformat"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/autoflake[${PYTHON_USEDEP}]
	dev-python/autopep8[${PYTHON_USEDEP}]
	dev-python/unify[${PYTHON_USEDEP}]
	dev-python/docformatter[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
