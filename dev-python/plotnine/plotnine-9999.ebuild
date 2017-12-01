# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Ebuild generated by python_ebuilder 0.0.1

EAPI="5"
[[ ${PV} = *9999* ]] && GIT_ECLASS="git-r3" || GIT_ECLASS=""
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} )

inherit ${GIT_ECLASS} distutils-r1 prefix


DESCRIPTION="A grammar of graphics for python"
HOMEPAGE="https://github.com/has2k1/plotnine"

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/has2k1/plotnine/tarball/v${PV} -> ${P}.tar.gz"
else
	EGIT_REPO_URI="https://github.com/has2k1/plotnine"
fi

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/mizani[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/patsy[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/statsmodels[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
dev-python/setuptools[${PYTHON_USEDEP}]
"




#plotnine-9999.ebuild
