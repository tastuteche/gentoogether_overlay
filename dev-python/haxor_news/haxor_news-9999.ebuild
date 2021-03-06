# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Ebuild generated by python_ebuilder 0.0.1

EAPI="5"
[[ ${PV} = *9999* ]] && GIT_ECLASS="git-r3" || GIT_ECLASS=""
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} )

inherit ${GIT_ECLASS} distutils-r1 prefix


DESCRIPTION="View and filter Hacker News from the command line Posts, comments, and linked web content."
HOMEPAGE="https://github.com/donnemartin/haxor-news"

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/donnemartin/haxor-news/tarball/v${PV} -> ${P}.tar.gz"
else
	EGIT_REPO_URI="https://github.com/donnemartin/haxor-news"
fi

LICENSE="Apache License 2.0"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/prompt_toolkit[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
dev-python/setuptools[${PYTHON_USEDEP}]
"
src_prepare() {
	sed -i -e "s@packages=find_packages()@packages=find_packages(exclude=['tests', 'tests.*'])@g" "${S}/setup.py" || die

	distutils-r1_src_prepare
}



#haxor_news-9999.ebuild
