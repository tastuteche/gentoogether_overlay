# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5,6} )

inherit eutils python-r1 bash-completion-r1

DESCRIPTION="Google Search from command line"
HOMEPAGE="https://github.com/jarun/googler"

if [[ ${PV} == *9999* ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
	KEYWORDS=""
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
	RESTRICT="mirror"
fi

LICENSE="LGPL-3"
SLOT="0"
IUSE="bash-completion fish-completion zsh-completion"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

src_prepare(){
	sed -i "s#/usr/local#/usr#" Makefile
	eapply_user
}

src_compile(){
	emake PREFIX="$EPREFIX/usr" DESTDIR="${D}"
}

src_install(){
	emake PREFIX="$EPREFIX/usr" DESTDIR="${D}" disable-self-upgrade
	emake PREFIX="$EPREFIX/usr" DESTDIR="${D}" install
	use bash-completion && newbashcomp auto-completion/bash/${PN}-completion.bash ${PN}
	if use fish-completion; then
		insinto /usr/share/fish/vendor_completions.d/
		doins auto-completion/fish/${PN}.fish
	fi
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins auto-completion/zsh/_${PN}
	fi
}
