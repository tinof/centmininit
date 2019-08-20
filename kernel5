#!/bin/bash
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml
sudo grub2-set-default 0
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo reboot
