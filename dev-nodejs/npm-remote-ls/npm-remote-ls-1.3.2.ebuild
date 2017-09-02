# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

#NODE_MODULE_EXTRA_FILES="common.js sync.js"
NODE_MODULE_DEPEND="async:2.0.0-rc.3
	 char-spinner:1.0.1
	 lodash:4.10.0
	 npm-package-arg:4.2.0
	 once:1.3.3
	 registry-url:3.0.3
	 request:2.37.0
	 semver:5.1.0
	 treeify:1.0.1
	 yargs:4.6.0 "





inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/fs-realpath:1.0.0"

DESCRIPTION="Examine a package's dependency graph before you install it"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

src_install() {
	node-module_src_install
	install_node_module_depend "fs.realpath:1.0.0"
}
