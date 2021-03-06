# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Ebuild generated by python_ebuilder 0.0.1

EAPI="5"
[[ ${PV} = *9999* ]] && GIT_ECLASS="git-r3" || GIT_ECLASS=""
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} )

inherit ${GIT_ECLASS} distutils-r1 prefix


DESCRIPTION="Minimalistic implementation of the Self Organizing Maps (SOM)"
HOMEPAGE="https://github.com/JustGlowing/minisom"

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/JustGlowing/minisom/tarball/v${PV} -> ${P}.tar.gz"
else
	EGIT_REPO_URI="https://github.com/JustGlowing/minisom"
fi

LICENSE="CC BY 3.0"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="
"




#MiniSom-9999.ebuild
