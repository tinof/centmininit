yum update
yum -y group install "Development Tools"
yum -y install redhat-lsb
yum -y install nano
wget https://raw.githubusercontent.com/tinof/centmininit/master/gcc-build-vars.sh -O ./gcc-build-vars.sh
mkdir gccb
cd gccb
git clone https://github.com/BobSteagall/gcc-builder.git
cd gcc-builder
git checkout gcc9
./build-gcc.sh | tee build.log
./stage-gcc.sh
