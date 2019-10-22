#PHPIONCUBE='y'

ENABLEMOTD_CSFMSG='n'         # motd banner csf message alert disaply
ENABLEMOTD_LINKSMSG='n'       # motd centminmod.com links bookmark alert display
DISABLE_IPVSIX='y'

AUTOTUNE_CLIENTMAXBODY='y'

CLOUDFLARE_ZLIB='y'

CLOUDFLARE_ZLIBPHP='n'
PHP_LIBZIP='y'              # use newer libzip instead of PHP embedded zip
PHP_ARGON='y'               # alias for PHP_LIBZIP, when PHP_ARGON='y' then PHP_LIBZIP='y'
LIBZIP_VER='1.5.2'          # required for PHP 7.2 + with libsodium & argon2
LIBSODIUM_VER='1.0.18'      # https://github.com/jedisct1/libsodium/releases
LIBSODIUM_NATIVE='y'        # optimise for specific cpu not portable between different cpu modules
LIBARGON_VER='20190702'     # https://github.com/P-H-C/phc-winner-argon2/releases


FPM_WAKEUP_PATCH='y'
WP_FASTCGI_CACHE='y' 
 
##For Linux Kernel  > 5.1.x
#NGINX_IOURING_PATCH='y' 

##Upgrading NGINX. Disable, if custom configs  
NGINX_ALLOWOVERRIDE='y'  


#SWITCH_PHPFPM_SYSTEMD='y'
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

LIBRESSL_SWITCH='n'
CLANG='n'
DEVTOOLSETSIX='n'
DEVTOOLSETSEVEN='n'
DEVTOOLSETEIGHT='y'
NGINX_DEVTOOLSETGCC='y'
 
CUSTOM_CURLRPM='y'
CUSTOM_CURLRPMVER='7.66.0-1.1'       # custom curl/libcurl version

PHP_PGO='y'
#PHP_PGO_ALWAYS='y'

#PHPPGO_INDEXPATH='/opt/phpbench/detailed_benchmark.php'
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
