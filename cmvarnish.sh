#!/bin/bash
# https://community.centminmod.com/threads/woocommerce-using-varnish-hitch-ssl-cloudflare-letsencrypt-nginx-with-sockets.19962/
# Varnish with Centminmod, by Atrix

wget https://raw.githubusercontent.com/tinof/centmininit/master/varnishcache_varnish63.repo -O /etc/yum.repos.d/varnishcache_varnish63.repo
yum -y install varnish.x86_64
dd if=/dev/random of=/etc/varnish/secret count=1

yum -y install hitch
semanage permissive -a varnishd_t
semanage permissive -a httpd_t
openssl dhparam -rand - 2048 | sudo tee /etc/hitch/dhparams.pem

wget https://raw.githubusercontent.com/tinof/centmininit/master/hitch-deploy-hook -O /usr/bin/hitch-deploy-hook
chmod a+x /usr/bin/hitch-deploy-hook

usermod -a -G varnish hitch
service hitch restart

#Since we’re going to store socket files in a dedicated directory, /var/run/varnish, we will “tell” SELinux what we’re going to use the directory for:
semanage fcontext -a -t varnishd_var_run_t "/var/run/varnish(/.*)?"

#And we also make sure that our sockets directory is created after reboot:
cat << _EOF_ >> /etc/tmpfiles.d/varnish.conf
  d /run/varnish 755 varnish varnish
_EOF_

#And we also create it right away via:
systemd-tmpfiles --create varnish.conf

#Make sure to setup correct SELinux label to our directory:
semanage fcontext -a -t httpd_var_run_t "/var/run/nginx(/.*)?"

#And ensure that the directory is created at boot time:
cat << _EOF_ >> /etc/tmpfiles.d/nginx.conf
  d /run/nginx 750 nginx varnish
_EOF_

#And we also create it right away via:
systemd-tmpfiles --create nginx.conf


