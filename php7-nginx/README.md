# PHP-Cli
可以应用于：
* Laravel

## BUILD
````
docker build . -t php7-nginx:0.1

````

## USAGE

````sh
# 使用如下命令创建
docker run -it --rm -v $PWD/app:/app php7-ngnix:0.1 /bin/bash
su - phpapp
composer create-project laravel/laravel /app 5.5.22

````