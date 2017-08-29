# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5,6} )

EGIT_REPO_URI="https://github.com/naiquevin/${PN}"

inherit git-r3 distutils-r1

DESCRIPTION="A command line utility to display dependency tree of the installed Python packages https://pypi.python.org/pypi/pipdeptree"
HOMEPAGE="A command line utility to display dependency tree of the installed Python packages https://pypi.python.org/pypi/pipdeptree"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/pip[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
