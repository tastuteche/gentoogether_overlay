# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1 autotools eutils toolchain-funcs flag-o-matic git-r3

DESCRIPTION="A Tool for Measuring String Similarity"
HOMEPAGE="http://mlsec.org/harry"
EGIT_REPO_URI="https://github.com/rieck/harry.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+prwlock +md5hash"

RDEPEND="
	>=sys-libs/zlib-1.2.1
	>=sys-libs/libomp-2.5.0
	>=dev-libs/libconfig-1.3.2
	>=app-arch/libarchive-3.1.2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
#DISTUTILS_IN_SOURCE_BUILD=1
src_prepare() {
	sed -i -e 's@examplesdir = $(DESTDIR)$(docdir)/@examplesdir = $(docdir)/@g' examples/alexa/Makefile.am
	sed -i -e 's@examplesdir = $(DESTDIR)$(docdir)/@examplesdir = $(docdir)/@g' examples/reuters/Makefile.am
	default
	eautoreconf
	pushd python

	cat <<EOF > setup.py
# -*- coding: utf-8 -*-
from setuptools import setup, find_packages

setup(
	name='harry',
	version="1.0",
	packages=find_packages(),
	include_package_data=False,
	install_requires=["matplotlib", "jellyfish", "Levenshtein", "numpy"],
)
EOF
	mkdir -p harry
	touch harry/__init__.py
	distutils-r1_src_prepare
	popd
}

# called by distutils-r1 for every python
python_configure() {
	# pre-process the files but don't run distutils
	pushd python
	emake PYSETUP=: PYTHON=${EPYTHON}
	cp harry.py harry/harry.py
	popd
}

src_configure() {
	econf --prefix="${EPREFIX}/usr" \
		  $(use_enable prwlock) \
		  $(use_enable md5hash)

	distutils-r1_src_configure
}

src_compile() {
	emake

	pushd python
	distutils-r1_src_compile
	popd
}

python_install_all(){
	local DISTUTILS_SINGLE_IMPL=1
	distutils-r1_python_install_all
	}
python_install(){
	local DISTUTILS_SINGLE_IMPL=1
	distutils-r1_python_install
	}
src_install() {
	# it's not autotools-based, so "${ED}" here, not "${D}", bug 531760
	emake install DESTDIR="${D}"

	pushd python
	distutils-r1_src_install
	popd

}
