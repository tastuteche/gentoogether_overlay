# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Ebuild generated by python_ebuilder 0.0.1

EAPI="5"
[[ ${PV} = *9999* ]] && GIT_ECLASS="git-r3" || GIT_ECLASS=""
PYTHON_COMPAT=( python{3_3,3_4,3_5} )

inherit ${GIT_ECLASS} distutils-r1 prefix


DESCRIPTION="asyncio (PEP 3156) Redis support"
HOMEPAGE="https://github.com/aio-libs/aioredis"

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/aio-libs/aioredis/tarball/v${PV} -> ${P}.tar.gz"
else
	EGIT_REPO_URI="https://github.com/aio-libs/aioredis"
fi

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="dev-python/hiredis[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
dev-python/setuptools[${PYTHON_USEDEP}]
"




#aioredis-9999.ebuild
