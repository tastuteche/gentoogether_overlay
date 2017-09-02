# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

EGIT_REPO_URI="https://github.com/myint/${PN}"

inherit git-r3 distutils-r1

DESCRIPTION="Removes unused imports and unused variables as reported by pyflakes https://pypi.python.org/pypi/autoflake"
HOMEPAGE="Removes unused imports and unused variables as reported by pyflakes https://pypi.python.org/pypi/autoflake"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/pyflakes[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
