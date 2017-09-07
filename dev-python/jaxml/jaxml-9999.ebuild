# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python3_{4,5,6} pypy )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/tastuteche/jaxml-py3"


DESCRIPTION="XML generator written in Python"
HOMEPAGE="http://www.librelogiciel.com/software/jaxml/action_Presentation https://pypi.python.org/pypi/jaxml"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 hppa ia64 ppc x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
