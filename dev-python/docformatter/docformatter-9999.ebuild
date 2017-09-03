# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit git-r3 distutils-r1

DESCRIPTION="Formats docstrings to follow PEP 257 https://pypi.python.org/pypi/docforma…"
HOMEPAGE="Formats docstrings to follow PEP 257 https://pypi.python.org/pypi/docforma…"
SRC_URI=""
EGIT_REPO_URI="https://github.com/myint/docformatter.git"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/untokenize[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

