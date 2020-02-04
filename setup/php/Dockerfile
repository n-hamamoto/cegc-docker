FROM php:7.3-apache

RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev \
  && docker-php-ext-install pdo_mysql mysqli mbstring gd iconv
#libonig-dev \
# mcrypt
#libpng12-dev

RUN a2enmod remoteip

#COPY remoteip.conf /etc/apache2/conf-enabled
#RUN mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak
#COPY apache2.conf /etc/apache2/


