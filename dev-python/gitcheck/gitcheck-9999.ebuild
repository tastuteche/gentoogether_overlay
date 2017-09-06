# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

EGIT_REPO_URI="https://github.com/badele/${PN}"

inherit git-r3 distutils-r1

DESCRIPTION="Check multiple git repository in one pass / Vérifiez vos dépôt git en une seule passe http://bruno.adele.im/projets/gitcheck"
HOMEPAGE="Check multiple git repository in one pass / Vérifiez vos dépôt git en une seule passe http://bruno.adele.im/projets/gitcheck"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/gitpython[${PYTHON_USEDEP}]
dev-python/colored[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
