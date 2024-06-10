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

$PKG_MANAGER -y update
$PKG_MANAGER -y install nano wget yum-utils epel-release
$PKG_MANAGER -y update


# MariaDB 10.6 default with PHP 8.0 default
yum -y update
yum -y install epel-release
curl -4sL https://centminmod.com/installer-el8x-mariadb10.6.sh -o installer-el8x-mariadb10.6.sh; bash installer-el8x-mariadb10.6.sh

# Create initial persistent config file to override centmin.sh defaults
mkdir -p /etc/centminmod
wget https://raw.githubusercontent.com/tinof/centmininit/master/custom_config.inc -O /etc/centminmod/custom_config.inc

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
cp -a /usr/local/csf/bin/regex.custom.pm /usr/local/csf/bin/regex.custom.pm.bak
egrep 'CUSTOM1_LOG|CUSTOM2_LOG|CUSTOM3_LOG|CUSTOM4_LOG' /etc/csf/csf.conf
sed -i "s|CUSTOM1_LOG = .*|CUSTOM1_LOG = \"/home/nginx/domains/\*/log/access.log\"|" /etc/csf/csf.conf
sed -i "s|CUSTOM2_LOG = .*|CUSTOM2_LOG = \"/home/nginx/domains/\*/log/error.log\"|" /etc/csf/csf.conf
sed -i "s|CUSTOM3_LOG = .*|CUSTOM3_LOG = \"/var/log/nginx/localhost.access.log\"|" /etc/csf/csf.conf
sed -i "s|CUSTOM4_LOG = .*|CUSTOM4_LOG = \"/var/log/nginx/localhost.error.log\"|" /etc/csf/csf.conf
egrep 'CUSTOM1_LOG|CUSTOM2_LOG|CUSTOM3_LOG|CUSTOM4_LOG' /etc/csf/csf.conf
wget -O /usr/local/csf/bin/regex.custom.pm https://gist.github.com/centminmod/f5551b92b8aba768c3b4db84c57e756d/raw/regex.custom.pm
csf -ra

# Cloudflare cronjob setup
crontab -l > cronjoblist
sed -i '/csfcf.sh/d' cronjoblist
echo "23 */12 * * * /usr/local/src/centminmod/tools/csfcf.sh auto >/dev/null 2>&1" >> cronjoblist
crontab cronjoblist

# Install and configure MALDET
cd /usr/local/src/centminmod/addons
./maldet.sh

# Update packages from city-fan.org repo
$PKG_MANAGER update -y --enablerepo=city-fan.org --disableplugin=priorities

package-cleanup -y --oldkernels --count=1

echo "Done!"
