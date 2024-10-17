#!/bin/bash

# Detect the AlmaLinux version
OS_VERSION=$(grep -oE '[0-9]+' /etc/almalinux-release | head -n 1)
if [[ "$OS_VERSION" == "8" ]]; then
    ELREPO_RELEASE_URL="https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm"
elif [[ "$OS_VERSION" == "9" ]]; then
    ELREPO_RELEASE_URL="https://www.elrepo.org/elrepo-release-9.el9.elrepo.noarch.rpm"
else
    echo "This script supports only AlmaLinux 8 and 9. Detected AlmaLinux version: $OS_VERSION"
    exit 1
fi

# Import the ELRepo GPG key
echo "Importing the ELRepo GPG key..."
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

# Install the ELRepo release package
echo "Installing the ELRepo release package for AlmaLinux $OS_VERSION..."
sudo dnf install -y $ELREPO_RELEASE_URL

# Update DNF repositories and system packages
echo "Updating DNF repositories and system packages..."
sudo dnf update -y

# Define the directory containing repo files and the replacement URL
REPO_DIR="/etc/yum.repos.d"
NEW_BASEURL="https://mirror.dogado.de/elrepo/"

# Modify the ELRepo configuration files
echo "Updating ELRepo configuration files to use the specified baseurl..."
for repo_file in "$REPO_DIR"/*.repo; do
    if grep -q "\[elrepo\]" "$repo_file"; then
        # Comment out any 'mirrorlist' line
        sed -i '/^mirrorlist=/ s/^/#/' "$repo_file"
        
        # Replace the 'baseurl' line or add it if it doesn't exist
        if grep -q "^baseurl=" "$repo_file"; then
            sed -i "s|^baseurl=.*|baseurl=$NEW_BASEURL|" "$repo_file"
        else
            # If baseurl doesn't exist, add it after the [elrepo] line
            sed -i "/\[elrepo\]/a baseurl=$NEW_BASEURL" "$repo_file"
        fi

        echo "Updated $repo_file"
    fi
done

# (Optional) Configure the fastestmirror plugin to use specific country mirrors
echo "Configuring fastestmirror plugin to prioritize specific country mirrors..."
echo "include_only=.nl,.fi" | sudo tee -a /etc/yum/pluginconf.d/fastestmirror.conf

# Disable SELinux by modifying the GRUB configuration
echo "Disabling SELinux in GRUB configuration..."
GRUB_FILE="/etc/default/grub"
if grep -q "GRUB_CMDLINE_LINUX" "$GRUB_FILE"; then
    sudo sed -i 's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="selinux=0 /' "$GRUB_FILE"
else
    echo 'GRUB_CMDLINE_LINUX="selinux=0"' | sudo tee -a "$GRUB_FILE"
fi

# Regenerate GRUB configuration based on EFI setup
echo "Regenerating GRUB configuration for EFI setup..."
sudo dnf install -y grub2-tools
sudo grub2-mkconfig -o /boot/efi/EFI/almalinux/grub.cfg

# Install the mainline kernel from ELRepo
echo "Installing the mainline kernel from ELRepo..."
sudo dnf --enablerepo=elrepo-kernel install kernel-ml -y

# Reboot the system to apply changes
echo "Rebooting the system to apply changes..."
sudo reboot
