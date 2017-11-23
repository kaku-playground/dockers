#
# Author Guo Yu
#

FROM debian:jessie

RUN  echo "deb http://ftp.uk.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

# Install packages
RUN apt-get update && apt-get -y install \
	apache2 \
	libapache2-mod-php5 \
	php5-mysqlnd \
	php5-curl \
	php5-gd \
	php5-intl \
	php-pear \
	php5-imagick \
	php5-imap \
	php5-mcrypt \
	php5-memcache \
	php5-pspell \
	php5-recode \
	php5-snmp \
	php5-sqlite \
	php5-tidy \
	php5-xmlrpc \
	php5-redis \
	php5-xsl \
	php5-cli \
	tzdata \
	ffmpeg

# 设置权限

# 设置 timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /app

WORKDIR /app
ADD ./apache2-foreground /app
RUN chmod u+x /app/apache2-foreground

RUN apt-get clean

EXPOSE 80

VOLUME ["/var/www/html"]

CMD ["/app/apache2-foreground"]
