#!bin/bash

usermod -u $NGINX_USERID phpapp
groupmod -g $WWW_DATA_USERID phpapp

/etc/init.d/php7.1-fpm start && nginx -g 'daemon off;'
