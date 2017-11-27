#
# Author Guo Yu

FROM php:7.1.11-cli-jessie

# 安装 Swoole
RUN pecl install swoole-1.9.22
RUN pecl clear-cache

ADD ./php.ini /usr/local/etc/php/conf.d/php.ini

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /app/app
RUN mkdir -p /app/data
RUN mkdir -p /app/log

CMD ["php", "/app/app/app.php"]


