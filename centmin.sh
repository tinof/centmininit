#!/bin/bash
set -e

# Check if the system is RHEL 8.x or later
if [ -e /etc/redhat-release ]; then
  RHEL_VERSION=$(grep -oP '\d+' /etc/redhat-release | head -1)
else
  RHEL_VERSION=0
fi

if [ "$RHEL_VERSION" -ge 8 ]; then
  PKG_MANAGER="dnf"
else
  PKG_MANAGER="yum"
fi

# Function to check if the server is a VPS
is_vps() {
  if [ -d "/proc/vz" ] || [ -d "/proc/xen" ]; then
    return 0
  else
    return 1
  fi
}


$PKG_MANAGER -y install nano wget yum-utils
$PKG_MANAGER -y upgrade

# Create initial persistent config file to override centmin.sh defaults
mkdir -p /etc/centminmod
wget https://raw.githubusercontent.com/tinof/centmininit/master/custom_config.inc -O /etc/centminmod/custom_config.inc

# Install centmin mod latest beta with php-fpm 8.1 default
curl -O https://centminmod.com/betainstaller81.sh && chmod 0700 betainstaller81.sh && bash betainstaller81.sh

# CPU Governor High Performance mode for dedicated servers
if ! is_vps; then
  cpupower frequency-set --governor performance
fi

# Pre-create Nginx HTTPS site’s dhparam file to speed up subsequent Nginx vhost creation
openssl dhparam -out /usr/local/nginx/conf/ssl/dhparam.pem 2048

# Setup extended CSF Firewall blocklists
/usr/local/src/centminmod/tools/csf-advancetweaks.sh

# Enable CSF Firewall native fail2ban-like support
csf --profile backup backup-b4-customregex
# Other CSF related commands and configurations go here

# Cloudflare cronjob setup
crontab -l > cronjoblist
sed -i '/csfcf.sh/d' cronjoblist
echo "23 */12 * * * /usr/local/src/centminmod/tools/csfcf.sh auto >/dev/null 2>&1" >> cronjoblist
crontab cronjoblist

# Install and configure MALDET
wget https://raw.githubusercontent.com/tinof/centmininit/master/maldet.sh -O /usr/local/src/centminmod/addons/maldet.sh
./usr/local/src/centminmod/addons/maldet.sh

# Update packages from city-fan.org repo
$PKG_MANAGER update -y --enablerepo=city-fan.org --disableplugin=priorities

package-cleanup -y --oldkernels --count=1

echo "Done!"
