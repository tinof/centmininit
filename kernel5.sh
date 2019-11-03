#!/bin/bash
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
yum -y --enablerepo=elrepo-kernel install kernel-ml
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
reboot
