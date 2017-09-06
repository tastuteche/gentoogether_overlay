# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

EGIT_REPO_URI="https://github.com/dslackw/${PN}"

inherit git-r3 distutils-r1

DESCRIPTION="Very simple Python library for color and formatting in terminal. https://pypi.python.org/pypi/colored"
HOMEPAGE="Very simple Python library for color and formatting in terminal. https://pypi.python.org/pypi/colored"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
