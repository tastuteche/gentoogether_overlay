# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

EGIT_REPO_URI="https://bitbucket.org/jason_delaat/pymonad"

inherit git-r3 distutils-r1

DESCRIPTION="PyMonad is a small library implementing monads and related data abstractions -- functors, applicative functors, and monoids"
HOMEPAGE="https://bitbucket.org/jason_delaat/pymonad"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
