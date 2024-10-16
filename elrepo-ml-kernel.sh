# Import the ELRepo GPG key
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

# Install the ELRepo release package
sudo dnf install -y https://www.elrepo.org/elrepo-release-9.el9.elrepo.noarch.rpm

# Update DNF repositories and system packages
sudo dnf update -y

# (Optional) Configure the fastestmirror plugin to use specific country mirrors
echo "include_only=.nl,.fi" | sudo tee -a /etc/yum/pluginconf.d/fastestmirror.conf

# Install the mainline kernel from ELRepo
sudo dnf --enablerepo=elrepo-kernel install kernel-ml -y

# Reboot the system to apply changes
sudo reboot
