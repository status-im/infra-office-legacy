FROM php:7.3-fpm

MAINTAINER Jakub Sokołowski <jakub@status.im>

# Update packages and install composer and PHP dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mariadb-client \
    libmemcached-dev \
    libpq-dev \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libbz2-dev \
    unzip \
    procps \
    cron \
    nginx \
    nano \
    wget \
    netcat \
    python3 \
    python3-pip \
    && pecl channel-update pecl.php.net \
    && pecl install apcu \
    && pip install awscli

# PHP Extensions
RUN docker-php-ext-install bcmath \
 && docker-php-ext-install zip \
 && docker-php-ext-install bz2 \
 && docker-php-ext-install mbstring \
 && docker-php-ext-install pdo \
 && docker-php-ext-install pdo_mysql \
 && docker-php-ext-install pcntl \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install gd

# Install the PHP mcrypt extention (from PECL, mcrypt has been removed from PHP 7.2)
RUN pecl install mcrypt-1.0.2 \
 && docker-php-ext-enable mcrypt \
 && pecl install memcached && docker-php-ext-enable memcached

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Frotend NPM/YARN
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
 && apt-get install -y nodejs \
 && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install yarn

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R www-data.www-data /run /var/lib/nginx /var/log/nginx

ENV VERSION=2.2.1
RUN wget https://github.com/Bottelet/DaybydayCRM/archive/refs/tags/$VERSION.tar.gz \
 && tar xf $VERSION.tar.gz --strip-components 1 \
 && rm $VERSION.tar.gz
WORKDIR /var/www/html

# Patch for mixed content errors (#287)
COPY AppServiceProvider.php /var/www/html/app/Providers/AppServiceProvider.php

# Build JS frontend
RUN npm install --pure-lockfile --ignore-engines \
 && npm run prod

# Build PHP application
RUN composer install -q -o

# Set permissions
RUN chmod 0777 -R ./bootstrap/cache ./storage/*

EXPOSE 80
EXPOSE 433

CMD php-fpm
