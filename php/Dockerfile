FROM php:7.2.3-fpm
LABEL maintainer="tsund" \
    email="tsund@qq.com" \
    version="7.2.3"

RUN apt-get update \
    && apt-get clean && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && echo "output_buffering = 4096" > /usr/local/etc/php/conf.d/php.ini
