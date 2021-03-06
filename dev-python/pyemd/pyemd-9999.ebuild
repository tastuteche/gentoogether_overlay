# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Ebuild generated by python_ebuilder 0.0.1

EAPI="5"
[[ ${PV} = *9999* ]] && GIT_ECLASS="git-r3" || GIT_ECLASS=""
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} )

inherit ${GIT_ECLASS} distutils-r1 prefix


DESCRIPTION="A Python wrapper for Ofir Pele and Michael Wermans implementation of the Earth Movers Distance."
HOMEPAGE="http://github.com/wmayner/pyemd"

if [[ ${PV} != *9999* ]]; then
	SRC_URI="http://github.com/wmayner/pyemd/tarball/v${PV} -> ${P}.tar.gz"
else
	EGIT_REPO_URI="http://github.com/wmayner/pyemd"
fi

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
dev-python/setuptools[${PYTHON_USEDEP}]
"




#pyemd-9999.ebuild
