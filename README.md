Install optimized Centminmod, developed by George Liu (eva2000).

### First Install KERNEL 5.x
yum -y install wget yum-utils; yum -y upgrade; wget https://raw.githubusercontent.com/tinof/centmininit/master/kernel5.sh; chmod +x kernel5.sh; ./kernel5.sh
Note run package-cleanup --oldkernels --count=1 after restart

### The go ahead and install Centminmod (PHP 7.4)
wget https://raw.githubusercontent.com/tinof/centmininit/master/centmin.sh; chmod +x centmin.sh; ./centmin.sh

### GOVERNOR FIX for EPYC2
cpupower frequency-set --governor performance



