# centmininit
Scripts are slightly modified from original ones, developed by George Liu (eva2000).

## KERNEL 5.x
yum -y install wget yum-utils; yum -y upgrade; wget https://raw.githubusercontent.com/tinof/centmininit/master/kernel5.sh; chmod +x kernel5.sh; ./kernel5.sh

## CENTMINMODINIT
wget https://raw.githubusercontent.com/tinof/centmininit/master/centmin.sh; chmod +x centmin.sh; ./centmin.sh; cd /usr/local/src/centminmod/addons/; ./customcurl.sh

##GCC9/GCC10 (not working)
mkdir gcc; cd gcc; wget https://raw.githubusercontent.com/tinof/centmininit/master/install.sh; chmod +x install.sh; ./install.sh install9

## WPSETUP.INC
wget https://raw.githubusercontent.com/tinof/centmininit/master/wpsetup.inc  -O /usr/local/src/centminmod/inc/wpsetup.inc

# MYSQL ADMIN
wget https://raw.githubusercontent.com/tinof/centmininit/master/mysqladmin_shell.sh; chmod +x mysqladmin_shell.sh; ./mysqladmin_shell.sh

##GOVERNOR FIX for EPYC2
cpupower frequency-set --governor performance
cpupower frequency-set --governor schedutil

./mysqladmin_shell.sh
