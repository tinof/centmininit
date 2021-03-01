Install optimized Centminmod, developed by George Liu (eva2000).

### Upgrade Centos 7 Kernel to ELRepo Kernel-ml for Enterprise Linux 7 and 8
yum -y install wget yum-utils; yum -y upgrade; wget https://raw.githubusercontent.com/tinof/centmininit/master/kernel5.sh; chmod +x kernel5.sh; ./kernel5.sh



Install Centminmod (PHP 8)
'''
wget https://raw.githubusercontent.com/tinof/centmininit/master/centmin.sh; chmod +x centmin.sh; ./centmin.sh
'''

### GOVERNOR change to PERFORMANCE for Dedicated AMD ZEN2/ZEN3 servers
'''
cpupower frequency-set --governor performance
'''
Note: Your CPU will run 10-15C hotter

You can support the original developer here: https://community.centminmod.com/threads/ways-to-support-centmin-mod.11435/



