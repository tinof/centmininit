yum -y upgrade
yum -y install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
yum -y --enablerepo=elrepo-kernel install kernel-ml
echo "GRUB_DEFAULT=0" >> /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg
