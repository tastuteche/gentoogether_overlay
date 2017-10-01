# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6


inherit eutils

DESCRIPTION="SIM tests lexical similarity in natural language texts and in programs in C, C++, Java, Pascal, Modula-2, Miranda, and Lisp."
HOMEPAGE="https://dickgrune.com/Programs/similarity_tester/"
SRC_URI="https://dickgrune.com/Programs/similarity_tester/sim_3_0_1.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"



RDEPEND="
"
DEPEND="${RDEPEND}
"

S=${WORKDIR}
src_prepare() {
	default
	sed -i -e '/# For MSDOS + MinGW/,/################/{s/^\([^#]\)/#\1/g;}' Makefile
	sed -i -e '/For UNIX-like systems/,/################/{s/^DIR =\(.*\)$/DIR = $(INSTALL_ROOT)/g;s/^BINDIR =\(.*\)$/BINDIR = $(DIR)\/bin/g;s/^MAN1DIR =\(.*\)$/MAN1DIR = $(DIR)\/share\/man\/man1/g;}' Makefile
	sed -i -e 's/sim_c++(EXE)/sim_c++$(EXE)/g' Makefile

}


src_compile() {
	emake test
}

src_install() {
	mkdir -p ${D}${EPREFIX}/usr/bin/
	mkdir -p ${D}${EPREFIX}/usr/share/man/man1
	emake INSTALL_ROOT="${D}${EPREFIX}/usr" install
}
