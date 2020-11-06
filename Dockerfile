FROM php:7.4-apache

RUN apt-get update
RUN apt-get install -y libicu-dev libpng-dev libbz2-dev libgmp-dev \
      librecode-dev libxml2-dev libargon2-dev libxslt-dev libzip-dev
RUN docker-php-ext-install \
      bcmath bz2 calendar exif \
      gd gettext gmp intl \
      mysqli pcntl pdo_mysql \
      sockets sysvmsg sysvsem sysvshm \
      xsl zip
#RUN   curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN cd /etc/apache2/mods-enabled \
    && ln -s ../mods-available/rewrite.load
