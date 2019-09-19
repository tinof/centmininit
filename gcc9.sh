#!/bin/sh
GCC_VERSION=9.2.0
sudo yum -y update
sudo yum -y install bzip2 wget gcc gcc-c++ gmp-devel mpfr-devel libmpc-devel make
gcc --version
wget http://gnu.mirror.constant.com/gcc/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.gz
tar zxf gcc-$GCC_VERSION.tar.gz
cd gcc-$GCC_VERSION
./contrib/download_prerequisites
mkdir gcc-build
cd gcc-build
