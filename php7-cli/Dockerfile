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
	tzdata
# 设置权限

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get clean

# 安装 PHP composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# 添加一个普通用户
RUN useradd phpapp -m -p phpapp2017
RUN usermod -u 2000 phpapp
RUN groupmod -g 2000 phpapp
RUN mkdir -p /app
RUN chown -R phpapp:phpapp /app




