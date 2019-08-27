!/bin/bash
# create initial persistent config file to override centmin.sh defaults
# https://centminmod.com/upgrade.html#persistent
mkdir -p /etc/centminmod
yum -y install nano
wget https://raw.githubusercontent.com/tinof/centmininit/master/upcloud_custom_config.inc -O /etc/centminmod/custom_config.inc


# install centmin mod latest beta with php-fpm 7.3 default
yum -y update; curl -O https://centminmod.com/betainstaller73.sh && chmod 0700 betainstaller73.sh && bash betainstaller73.sh


# setup extended CSF Firewall blocklists https://community.centminmod.com/posts/50060/
/usr/local/src/centminmod/tools/csf-advancetweaks.sh

# enable CSF Firewall native fail2ban like support
# https://community.centminmod.com/posts/62343/
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

mkdir -p /root/tools
cd /root/tools/
wget -O mysqladmin_shell.sh https://github.com/centminmod/centminmod/raw/123.09beta01/addons/mysqladmin_shell.sh
chmod +x mysqladmin_shell.sh


echo "Done!"
