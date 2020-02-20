AUTO_GITUPDATE='y'

VHOSTCTRL_CLOUDFLAREINC='y'

ENABLEMOTD_CSFMSG='n'         # motd banner csf message alert disaply
ENABLEMOTD_LINKSMSG='n'       # motd centminmod.com links bookmark alert display
DISABLE_IPVSIX='y'

AUTOTUNE_CLIENTMAXBODY='y'

## FOR PHP 7.4+
FPM_WAKEUP_PATCH='y'

#AUTODETECPHP_OVERRIDE='y'

# Maintenance Mode (will run maintenance mode during these upgrades)
NGINX_UPDATEMAINTENANCE='y'
PHP_UPDATEMAINTENANCE='y'
MARIADB_UPDATEMAINTENANCE='y'
 
##For Linux Kernel  > 5.1.x
NGINX_IOURING_PATCH='y' 

##Upgrading NGINX. Disable, if custom configs  
NGINX_ALLOWOVERRIDE='y'  

NGINX_BROTLIDEP_UPDATE='y'
NGINX_DYNAMICTLS='y'  
NGINX_SSLCACHE_ALLOWOVERRIDE='y'    
NGXDYNAMIC_BROTLI='y'
NGINX_LIBBROTLI='y'
NGINXPATCH='y'
NGINX_GEOIPTWOLITE='y
NGXDYNAMIC_GEOIPTWOLITE='y'

MM_LICENSE_KEY='kmKFLNgEjpka4daq'

AUTOHARDTUNE_NGINXBACKLOG='y'

MARIADB_INSTALLTENFOUR='y'
SET_DEFAULT_MYSQLCHARSET='utf8mb4'
  
LETSENCRYPT_DETECT='y'
DUALCERTS='y'
NGINX_HPACK='y'

GCC_FALIGN_FUNCTION='y'

LIBRESSL_SWITCH='n'
CLANG='n'
DEVTOOLSETSIX='n'
DEVTOOLSETSEVEN='n'
DEVTOOLSETEIGHT='y'
DEVTOOLSETNINE='n'
NGINX_DEVTOOLSETGCC='y'
GENERAL_DEVTOOLSETGCC='y'
CRYPTO_DEVTOOLSETGCC='y'
 
CUSTOM_CURLRPM='y'
CUSTOM_CURLRPMVER='7.68.0'       # custom curl/libcurl version

PHP_PGO='y'

#PHPPGO_INDEXPATH='/home/nginx/domains/XX/public/index.php'
#PHPPGO_INDEXPATH_TWO='/home/nginx/domains/XX/public/index.php'

PHP_TUNING='y'

PHP_ARGON='y
PHP_BROTLI='y'
PHP_LZFOUR='y'
PHP_LZF='y'
PHP_ZSTD='y'

PHPDEBUGMODE='n'             # --enable-debug PHP compile flag
PHPFINFO='n'                 # Disable or Enable PHP File Info extension
PHPRECODE=n                  # Disable or Enable PHP Recode extension
PHPSNMP='n'                  # Disable or Enable PHP SNMP extension
PHPIMAGICK='n'               # Disable or Enable PHP ImagicK extension
PHPMAILPARSE='n'             # Disable or Enable PHP mailparse extension
PHPIONCUBE='n'               # Disable or Enable Ioncube Loader via addons/ioncube.sh
#PHP_LTO='y'  #For 16+ Cores, 32Gb+ RAM
PHP_MEMCACHE='n'
PHP_MEMCACHED='n'  
PHPREDIS='n'

ZSTD_LOGROTATE_NGINX='y'
ZSTD_LOGROTATE_PHPFPM='y'

MEMCACHED_INSTALL='n'
NSD_INSTALL='n'
MEMCACHED_DISABLED='y' 
NSD_DISABLED='y'  
MARCH_TARGETNATIVE_ALWAYS='y'

NGINX_HTTPREDIS='n'
