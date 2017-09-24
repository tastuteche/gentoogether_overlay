# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="none"
#RUBY_FAKEGEM_EXTRADOC="BUGS README TODO"
#RUBY_FAKEGEM_EXTRAINSTALL="metasm metasm.rb misc samples"

inherit ruby-fakegem

DESCRIPTION="Markdown lint tool"
HOMEPAGE="https://github.com/markdownlint/markdownlint"

LICENSE="LGPL-2.1"
SLOT="${PV}"


if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/markdownlint/markdownlint"
	KEYWORDS=""
	SRC_URI=""
	EGIT_CHECKOUT_DIR="${WORKDIR}/all"
else
	KEYWORDS="~amd64 ~arm ~x86"
fi

#QA_PREBUILT="usr/lib*/ruby/gems/*/gems/${P}/${PN}/dynldr-linux-x64-233.so"

ruby_add_bdepend "dev-ruby/bundler"
ruby_add_bdepend "dev-ruby/pry"
ruby_add_bdepend "dev-ruby/minitest"
ruby_add_bdepend "dev-ruby/rake"
ruby_add_bdepend "dev-ruby/mixlib-cli"
ruby_add_bdepend "dev-ruby/mixlib-config"
ruby_add_bdepend "dev-ruby/kramdown"

all_ruby_prepare() {
	if [ -f Gemfile.lock ]; then
		rm  Gemfile.lock || die
	fi

	#mkdir bin
	#ln -s ../samples/disassemble.rb ./bin/disassemble
	#ln -s ../samples/disassemble-gui.rb ./bin/disassemble-gui
	sed -i -e "s@'rake', '~> 11.2'@'rake', '~> 12.0'@g" mdl.gemspec || die
}

each_ruby_prepare() {
	if [ -f Gemfile ]
	then
			BUNDLE_GEMFILE=Gemfile ${RUBY} -S bundle install --local || die
			BUNDLE_GEMFILE=Gemfile ${RUBY} -S bundle check || die
	fi
}

all_ruby_install() {
	all_fakegem_install

	#ruby_fakegem_binwrapper disassemble
	#ruby_fakegem_binwrapper disassemble-gui
}

each_ruby_test() {
	${RUBY} -Ilib:. -e "Dir['tests/*.rb'].each{|f| require f}" || die
}
