# Copyright 2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_{6,7} pypy2_0 python3_{4,5,6} )

inherit eutils multiprocessing distutils-r1 git-r3

DESCRIPTION="Library for Machine Intelligence"

HOMEPAGE="https://www.tensorflow.org/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/tensorflow/tensorflow"
#EGIT_COMMIT="efe5376f3dec8fcc2bf3299a4ff4df6ad3591c88"
#dev-java/oracle-jdk-bin
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE="cuda opencl"
RESTRICT="primaryuri"

RDEPEND="
	>=dev-python/numpy-1.11.2-r1
	>=dev-python/six-1.10.0
	>=dev-libs/nvidia-cuda-cudnn-8.0
	>=dev-util/nvidia-cuda-toolkit-8.0.61
	>=x11-drivers/nvidia-drivers-3.78.13
"

DEPEND="
	>=dev-python/setuptools-34.3.3
	>=dev-util/bazel-0.4.5[tools]
	>=dev-python/pip-9.0.1-r1
	>=dev-python/wheel-0.29.0
	>=dev-lang/swig-3.0.8
	dev-python/bleach[${PYTHON_USEDEP}]
	dev-python/protobuf-python[${PYTHON_USEDEP}]
	dev-python/futures[${PYTHON_USEDEP}]
	dev-python/enum34[${PYTHON_USEDEP}]
	dev-python/html5lib[${PYTHON_USEDEP}]
	${RDEPEND}
"
pkg_setup() {
	#/r/a/p/var/tmp/portage/sci-libs/tensorflow-9999
	#https://stackoverflow.com/questions/39827168/using-cuda-8-0-with-gcc-6-x-bad-function-overloading-complaint
	#export EXTRA_NVCCFLAGS="-std=c++11 -Xcompiler -D__CORRECT_ISO_CPP11_MATH_H_PROTO"
	#
	export LD_LIBRARY_PATH=/r/a/p/opt/cuda/lib64:/r/a/p/opt/cuda/extras/CUPTI/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
}

src_prepare() {
	sed -i -e 's/protobuf == 3.0.0a3/protobuf >= 2.6.0/g' \
		tensorflow/tools/pip_package/setup.py
	sed -i -e "s@'/\(usr\|opt\|sbin\)@'/r/a/p/\1@g" ./configure.py || die
	find "${S}" -type f -name 'CROSSTOOL*' -exec sed -i -e 's@\("\|-B\)/\(usr\|opt\|sbin\)@\1/r/a/p/\2@g' {} \;
}

src_configure() {
	#         "-nvcc_options=compiler-options -D__CORRECT_ISO_CPP11_MATH_H_PROTO",
	export TF_NEED_CUDA=1
	export TF_CUDNN_VERSION=7
	export TF_CUDA_VERSION=9.0
	yes "" | ./configure

	cat > CROSSTOOL << EOF
tool_path {
	name: "gcc"
	path: "${CC}"
}
tool_path {
	name: "g++"
	path: "${CXX}"
EOF

	echo "Will build with $(makeopts_jobs) jobs"

}

src_compile() {
	#--incompatible_disallow_set_constructor=false
	local JAVA_HOME_DECL="$(java-config --print oracle-jdk-bin-1.8 | grep JAVA_HOME)"
	eval "export $JAVA_HOME_DECL"

	# Add /proc/self to avoid a sandbox breakage
	local -x SANDBOX_WRITE="${SANDBOX_WRITE}"
	echo "SANDBOX_WRITE=$SANDBOX_WRITE"
	addwrite /proc/self

	#--action_env=EXTRA_NVCCFLAGS
	cat > bazelrc << EOF
startup --batch
build --spawn_strategy=standalone --genrule_strategy=standalone --config=cuda --action_env=LD_LIBRARY_PATH --action_env=PATH --test_env=LD_LIBRARY_PATH --test_env=PATH
build --jobs $(makeopts_jobs)
EOF
	export BAZELRC="$PWD/bazelrc"
	#--action_env=EXTRA_NVCCFLAGS
	bazel build \
	 --spawn_strategy=standalone --genrule_strategy=standalone --config=cuda --action_env=LD_LIBRARY_PATH --test_env=LD_LIBRARY_PATH --test_env=PATH \
	 -c opt //tensorflow/tools/pip_package:build_pip_package
}

src_install() {
	bazel-bin/tensorflow/tools/pip_package/build_pip_package "${S}/tensorflow_pkg"
	whl_path=$(realpath "${S}/tensorflow_pkg/*.whl")
	pushd $(dirname "$whl_path")
	pip install --no-deps --root "${D}" $(basename "$whl_path")
	popd
	# mkdir -p "${ED}/d/"
	# mv "${ED}"/usr/lib64/python3.5/site-packages/tensorboard* "${ED}/d/"
	# mv "${ED}"/usr/lib64/python3.5/site-packages/tensorflow* "${ED}/d/"
	# rm -rf "${ED}"/usr/lib*/python*/site-packages/
	# mkdir -p "${ED}/usr/lib64/python3.5/site-packages"
	# mv "${ED}/d/tensorboard*" "${ED}/usr/lib64/python3.5/site-packages/"
	# mv "${ED}/d/tensorflow*" "${ED}/usr/lib64/python3.5/site-packages/"
	# rm -rf  "${ED}/d/"
}
