echo "To install WP Rocket support for centminmod.com hosted domain, please input your domain (example something.com)"
echo "Note: This script assumes you are using SSL"
read domain

sed -i 's/php-wpsc/php/g' /usr/local/nginx/conf/conf.d/$domain.ssl.conf
cd /usr/local/nginx
git clone https://github.com/SatelliteWP/rocket-nginx.git
cd rocket-nginx; cp rocket-nginx.ini.disabled rocket-nginx.ini
php rocket-nginx.ini; php rocket-parser.php
service nginx restart

echo "To finish WP Rocket support for centminmod.com"
echo "Add 2 to your /usr/local/nginx/conf/conf.d/YOURDOMAIN.gr.ssl.conf"
echo "include /usr/local/nginx/rocket-nginx/default.conf;"
echo "Replace try_files with"
echo "try_files $uri $uri/ /index.php?$args;"
echo "Then run ngxrestart to apply the changes to Nginx"
