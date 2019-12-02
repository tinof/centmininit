read -ep "enter vhost domain name you want to setup cloudflare origin pull for: " vhostname ;
mkdir -p /usr/local/nginx/conf/ssl/cloudflare/$vhostname ;
cd /usr/local/nginx/conf/ssl/cloudflare/$vhostname ;
wget https://support.cloudflare.com/hc/en-us/article_attachments/201243967/origin-pull-ca.pem -O origin.crt ;
echo -e "ssl_client_certificate /usr/local/nginx/conf/ssl/cloudflare/$vhostname/origin.crt;\nssl_verify_client on;" ;
