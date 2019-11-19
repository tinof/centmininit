CMGIT='https://github.com/centminmod/centminmod.git'
AUTO_GITUPDATE='y'
EMAIL='tino.fotiou@gmail.com'

ENABLEMOTD_CSFMSG='n'         # motd banner csf message alert disaply
ENABLEMOTD_LINKSMSG='n'       # motd centminmod.com links bookmark alert display
DISABLE_IPVSIX='y'

AUTOTUNE_CLIENTMAXBODY='y'

CLOUDFLARE_ZLIB='y'

CLOUDFLARE_ZLIBPHP='y'

## FOR PHP 7.4+
#FPM_WAKEUP_PATCH='y'

AUTODETECPHP_OVERRIDE='y'
SWITCH_PHPFPM_SYSTEMD='y'
PHP_LTO='y'

WP_FASTCGI_CACHE='y' 
 
##For Linux Kernel  > 5.1.x
NGINX_IOURING_PATCH='y' 

##Upgrading NGINX. Disable, if custom configs  
NGINX_ALLOWOVERRIDE='y'  

#NGINX_FATLTO_OBJECTS='n'        # enable -ffat-lto-objects flag for nginx builds - much slower compile times
#NGINX_NOFATLTO_OBJECTS='n'      # enable -fno-fat-lto-objects flag for nginx builds - much slower compile times

NGINX_MODSECURITY='n'
NGINX_DYNAMICTLS='y'  
NGINX_SSLCACHE_ALLOWOVERRIDE='y'  
NGINX_ZERODT='y'  
NGXDYNAMIC_BROTLI='y'
NGINX_LIBBROTLI='y'
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
CUSTOM_CURLRPMVER='7.67.0'       # custom curl/libcurl version

PHP_MYSQLSOCKPATH='/var/lib/mysql'

PHP_PGO='y'
#PHP_PGO_ALWAYS='y'

#PHPPGO_INDEXPATH='/home/nginx/domains/XX/public/index.php'
#PHPPGO_INDEXPATH_TWO='/home/nginx/domains/XX/public/index.php'

PHP_TUNING='y'

PHP_BROTLI='y'
PHP_LZFOUR='y'
PHP_LZF='y'
PHP_ZSTD='y'
  
PHPREDIS='n' 
PHP_MEMCACHE='n'
PHP_MEMCACHED='n'

ZSTD_LOGROTATE_NGINX='y'
ZSTD_LOGROTATE_PHPFPM='y'

NGINX_HTTPREDIS='n' 
PHP_MEMCACHE='n'
PHP_MEMCACHED='n'
  
MEMCACHED_INSTALL='n'
NSD_INSTALL='n'
MEMCACHED_DISABLED='y' 
NSD_DISABLED='y'  
MARCH_TARGETNATIVE_ALWAYS='y'
