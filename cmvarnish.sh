#!/bin/bash
# https://community.centminmod.com/threads/woocommerce-using-varnish-hitch-ssl-cloudflare-letsencrypt-nginx-with-sockets.19962/
# Varnish with Centminmod, by Atrix

wget https://raw.githubusercontent.com/tinof/centmininit/master/varnishcache_varnish63.repo -O /etc/yum.repos.d/varnishcache_varnish63.repo
yum -y install varnish.x86_64
dd if=/dev/random of=/etc/varnish/secret count=1

yum install hitch
semanage permissive -a varnishd_t
semanage permissive -a httpd_t
openssl dhparam -rand - 2048 | sudo tee /etc/hitch/dhparams.pem

wget https://raw.githubusercontent.com/tinof/centmininit/master/hitch-deploy-hook -O /usr/bin/hitch-deploy-hook
chmod a+x /usr/bin/hitch-deploy-hook

usermod -a -G varnish hitch
service restart hitch
