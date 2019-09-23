yum group install "Development Tools"
yum install redhat-lsb
mkdir gccb
cd gccb
git clone https://github.com/BobSteagall/gcc-builder.git
cd gcc-builder
git checkout gcc9
./build-gcc.sh | tee build.log
./stage-gcc.sh
