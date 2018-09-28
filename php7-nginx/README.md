# PHP-NGINX
可以应用于：
* Laravel

## BUILD
````
docker build . -t php7-nginx:0.1

````

## 使用如下命令创建 Laravel 工程

````sh
[宿主 docker]# docker run -it --rm \
-v $PWD/app:/app \
-p -p 3000:80 \
--name php7-laravel \
php7-nginx:0.1 /bin/bash

[容器 /]# su - phpapp
[容器 /]$ cd /app
[容器 /]$ composer create-project laravel/laravel /app 5.7.0



````


## 参考文档
* [composer 官网](https://getcomposer.org/)