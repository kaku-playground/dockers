#!bin/bash

usermod -u $NGINX_USERID phpapp
groupmod -g $NGINX_GROUPID phpapp

/etc/init.d/php7.1-fpm start && nginx -g 'daemon off;'
