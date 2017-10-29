# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Ebuild generated by python_ebuilder 0.0.1

EAPI="5"
[[ ${PV} = *9999* ]] && GIT_ECLASS="git-r3" || GIT_ECLASS=""
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit ${GIT_ECLASS} distutils-r1 prefix


DESCRIPTION="Pretty-print tabular data"
HOMEPAGE="https://bitbucket.org/astanin/python-tabulate"

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://bitbucket.org/astanin/python-tabulate/tarball/v${PV} -> ${P}.tar.gz"
else
	EGIT_REPO_URI="https://bitbucket.org/astanin/python-tabulate.git"
fi

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="
"




#tabulate-9999.ebuild
