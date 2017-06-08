# See https://github.com/docker-library/php/blob/4677ca134fe48d20c820a19becb99198824d78e3/7.0/fpm/Dockerfile
FROM php:7.1-fpm

MAINTAINER Moave Medien <support@moave.de>

RUN apt-get update && apt-get install -y \
    git \
    sudo \
    unzip \
    zlib1g-dev \
    libicu-dev \
    g++ \
    libmcrypt-dev \
    libpng-dev \
    gettext-base


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql gd intl mbstring mcrypt opcache

# install xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN echo "upload_max_filesize = 64M" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN echo 'alias contao="php bin/console"' >> ~/.bashrc
RUN echo 'alias ll="ls -la"' >> ~/.bashrc

ADD contao_install.sh /opt/
ADD parameters.yml.template /opt/

RUN usermod -u 1000 www-data

WORKDIR /app

# change owner for app
RUN chown -R www-data:www-data /app
