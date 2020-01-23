FROM php:7.3-apache

# Core mcrypt PDO Phar Reflection SimpleXML SPL 
RUN apt-get update && \
  apt-get install -y libicu-dev libpng-dev libbz2-dev libgmp-dev \
    librecode-dev libxml2-dev libargon2-dev libxslt-dev libzip-dev && \
  docker-php-ext-install \
    bcmath bz2 calendar exif \
    gd gettext gmp intl \
    mysqli pcntl pdo_mysql \
    recode shmop soap \
    sockets sysvmsg sysvsem sysvshm wddx \
    xsl zip  && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN cd /etc/apache2/mods-enabled \
    && ln -s ../mods-available/rewrite.load
