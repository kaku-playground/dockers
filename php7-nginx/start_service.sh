#!bin/bash

/etc/init.d/php7.1-fpm start && nginx -g 'daemon off;'
