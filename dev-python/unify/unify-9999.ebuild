# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit git-r3 distutils-r1

DESCRIPTION="Modifies strings to all use the same quote where possible https://pypi.python.org/pypi/unify"
HOMEPAGE="Modifies strings to all use the same quote where possible https://pypi.python.org/pypi/unify"
SRC_URI=""
EGIT_REPO_URI="https://github.com/myint/unify.git"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/untokenize[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

