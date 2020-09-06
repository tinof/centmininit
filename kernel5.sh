#!/bin/bash
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
yum -y --enablerepo=elrepo-kernel install kernel-ml
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
#wget https://raw.githubusercontent.com/tinof/centmininit/master/wpsetup.inc  -O /usr/local/src/centminmod/inc/wpsetup.inc 
#chmod +x /etc/rc.d/rc.local
#echo "WPCLI_CE_QUERYSTRING_INCLUDED='y'" >> /etc/centminmod/custom_config.inc
reboot
