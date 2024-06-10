rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
dnf install https://www.elrepo.org/elrepo-release-9.el9.elrepo.noarch.rpm
dnf update
echo "include_only=.nl,.fi" >> /etc/yum/pluginconf.d/fastestmirror.conf
dnf --enablerepo=elrepo-kernel install kernel-ml
reboot
