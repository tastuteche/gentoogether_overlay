# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python{3_3,3_4,3_5} )

inherit git-r3 distutils-r1

MY_P="${P/_rc/-rc}"

DESCRIPTION="A helper for using rope refactoring library in IDEs"
HOMEPAGE="https://pypi.python.org/pypi/ropemode"
EGIT_REPO_URI="https://github.com/python-rope/ropemode"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-python/rope-0.9.2[${PYTHON_USEDEP}]"
DEPEND="${DEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"
