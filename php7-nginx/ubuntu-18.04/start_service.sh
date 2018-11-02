#!bin/bash

if [ -z "${NGINX_USERID}" ]; then
    echo "Using default user."
else
    usermod -u $NGINX_USERID phpapp
fi

if [ -z "${NGINX_GROUPID}" ]; then
    echo "Using default group."
else
    groupmod -g $NGINX_GROUPID phpapp
fi

/etc/init.d/php7.2-fpm start && nginx -g 'daemon off;'
