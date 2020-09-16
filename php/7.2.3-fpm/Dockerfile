FROM php:7.2.3-fpm
LABEL maintainer="tsund" \
    email="tsund@qq.com" \
    version="7.2.3-fpm"

RUN apt-get update \
    && apt-get install -y libgd-dev libzip-dev \
    && apt-get clean && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include \
    && docker-php-ext-install gd pdo pdo_mysql mysqli zip

COPY ./php.ini /usr/local/etc/php/conf.d/
