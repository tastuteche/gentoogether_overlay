# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Ebuild generated by python_ebuilder 0.0.1

EAPI="5"
[[ ${PV} = *9999* ]] && GIT_ECLASS="git-r3" || GIT_ECLASS=""
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} )

inherit ${GIT_ECLASS} distutils-r1 prefix


DESCRIPTION="An easy-to-use library for recommender systems."
HOMEPAGE="http://surpriselib.com"

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/NicolasHug/Surprise/tarball/v${PV} -> ${P}.tar.gz"
else
	EGIT_REPO_URI="https://github.com/NicolasHug/Surprise"
fi

LICENSE="GPLv3+"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
dev-python/setuptools[${PYTHON_USEDEP}]
"




#scikit-surprise-9999.ebuild
