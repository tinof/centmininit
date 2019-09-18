#!/bin/sh
GCC_VERSION=9.2.0
sudo yum -y update
sudo yum -y install bzip2 wget gcc gcc-c++ gmp-devel mpfr-devel libmpc-devel make
gcc --version
wget http://gnu.mirror.constant.com/gcc/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.gz
tar zxf gcc-$GCC_VERSION.tar.gz
mkdir gcc-build
cd gcc-build
../gcc-$GCC_VERSION/configure --prefix=/opt/gcc-9.2.0 --disable-multilib --enable-bootstrap --enable-plugin --with-gcc-major-version-only --enable-shared --disable-nls --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-install-libiberty --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --with-linker-hash-style=gnu --enable-languages=c,c++ --enable-initfini-array --disable-libgcj --enable-gnu-indirect-function --with-tune=generic --build=x86_64-redhat-linux --enable-lto --enable-gold
make -j$(nproc)
sudo make install
gcc --version
cd ..
rm -rf gcc-build
