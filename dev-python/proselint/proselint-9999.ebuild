# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

EGIT_REPO_URI="https://github.com/amperser/${PN}"

inherit git-r3 distutils-r1

DESCRIPTION="A linter for prose. http://proselint.com"
HOMEPAGE="A linter for prose. http://proselint.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
