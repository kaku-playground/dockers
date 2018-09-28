#
# Author Guo Yu
#
FROM ubuntu:17.10

# Install packages
RUN apt-get update && apt-get -y install \
	php7.1-mysqlnd \
	php7.1-curl \
	php7.1-gd \
	php7.1-intl \
	php-pear \
	php7.1-imagick \
	php7.1-imap \
	php7.1-mcrypt \
	php7.1-memcache \
	php7.1-pspell \
	php7.1-recode \
	php7.1-snmp \
	php7.1-sqlite \
	php7.1-tidy \
	php7.1-xmlrpc \
	php7.1-redis \
	php7.1-xsl \
	php7.1-cli \
	php7.1-amqp \
	php7.1-zip \
	php7.1-mbstring \
	php7.1-fpm \
	tzdata \
	nginx
# 设置权限

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# 清除缓存
RUN apt-get clean

# 安装 Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# 设置 PHP-FPM
RUN echo "cgi.fix_pathinfo=0" >> /etc/php/7.1/fpm/php.ini

# 创建一个叫 laravel 的用户供使用
RUN useradd phpapp -m -p phpapp2018

# 配置 Php7-fpm
# /etc/php/7.1/fpm/pool.d

# 配置 Nginx 环境
RUN rm -rf ./etc/nginx/sites-enabled/**
ADD nginx-phpapp-conf /etc/nginx/sites-available/nginx-phpapp-conf
RUN ln -s /etc/nginx/sites-available/nginx-phpapp-conf /etc/nginx/sites-enabled/default

RUN mkdir -p /app
RUN chown -R phpapp:phpapp /app

ADD www.conf /etc/php/7.1/fpm/pool.d/www.conf
ADD start_service.sh /start_service.sh

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["bash", "/start_service.sh"]

