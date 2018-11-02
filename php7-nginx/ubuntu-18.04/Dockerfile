#
# Author Guo Yu
#
FROM ubuntu:18.04

RUN RUN apt-get update && apt-get -y install tzdata

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Install packages
RUN apt-get -y install \
	php7.2-mysqlnd \
	php7.2-curl \
	php7.2-gd \
	php7.2-intl \
	php-pear \
	php7.2-imagick \
	php7.2-imap \
	php7.2-memcache \
	php7.2-pspell \
	php7.2-recode \
	php7.2-snmp \
	php7.2-sqlite \
	php7.2-tidy \
	php7.2-xmlrpc \
	php7.2-redis \
	php7.2-xsl \
	php7.2-cli \
	php7.2-amqp \
	php7.2-zip \
	php7.2-mbstring \
	php7.2-fpm \
	nginx

# 清除缓存
RUN apt-get clean

# 安装 Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# 设置 PHP-FPM
RUN echo "cgi.fix_pathinfo=0" >> /etc/php/7.1/fpm/php.ini

# 创建一个叫 laravel 的用户供使用
RUN useradd phpapp -m -p pHp@1995

# 配置 Php7-fpm
# /etc/php/7.2/fpm/pool.d

# 配置 Nginx 环境
RUN rm -rf ./etc/nginx/sites-enabled/**
ADD nginx-phpapp-conf /etc/nginx/sites-available/nginx-phpapp-conf
RUN ln -s /etc/nginx/sites-available/nginx-phpapp-conf /etc/nginx/sites-enabled/default

RUN mkdir -p /app
RUN chown -R phpapp:phpapp /app

ADD www.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD start_service.sh /start_service.sh

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["bash", "/start_service.sh"]

