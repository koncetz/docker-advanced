FROM php:7.2-apache

RUN docker-php-ext-install pdo pdo_mysql
WORKDIR /var/www/html/
COPY ./apps/file-web /var/www/html/
