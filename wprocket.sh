grn=$'\e[1;32m'

printf "Note: This script assumes you are using SSL and chose WP Super Cache with option 22"
printf "\n\n${grn}To install WP Rocket Nginx support for centminmod.com hosted domain,\nplease input your domain (example glhf.com):${NC}"
read domain

sed -i 's/php-wpsc/php/g' /usr/local/nginx/conf/conf.d/$domain.ssl.conf
##sed -i '78i s/^/#/' /usr/local/nginx/conf/conf.d/$domain.ssl.conf <- NEEDs FIXING
##sed -i -e "79i try_files $uri $uri/ /index.php?$args;" /usr/local/nginx/conf/conf.d/$domain.ssl.conf
##sed -i -e "137i include /usr/local/nginx/rocket-nginx/default.conf;"/usr/local/nginx/conf/conf.d/$domain.ssl.conf

cd /usr/local/nginx
git clone https://github.com/SatelliteWP/rocket-nginx.git
cd rocket-nginx
cp rocket-nginx.ini.disabled rocket-nginx.ini
php rocket-nginx.ini
php rocket-parser.php
service nginx restart
