# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python{3_3,3_4,3_5} )

inherit git-r3 distutils-r1 eutils readme.gentoo

DESCRIPTION="Rope in Emacs"
HOMEPAGE="https://github.com/python-rope/ropemacs
	https://pypi.python.org/pypi/ropemacs"
EGIT_REPO_URI="https://github.com/python-rope/ropemacs"

LICENSE="GPL-1+"		# GPL without version
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/rope[${PYTHON_USEDEP}]
	dev-python/ropemode[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

src_install() {
	local DOCS="${DOCS} README.rst docs/*.rst"
	distutils-r1_src_install

	DOC_CONTENTS="In order to enable ropemacs support in Emacs, install
		app-emacs/pymacs and add the following line to your ~/.emacs file:
		\\n\\t(pymacs-load \"ropemacs\" \"rope-\")"
	readme.gentoo_create_doc
}
