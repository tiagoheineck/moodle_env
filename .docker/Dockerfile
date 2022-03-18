FROM php:7.4.28-apache as apache

# https://gist.github.com/antfroger/1f2b24fdba0f215a41c8a94e8aa062f7
# https://dev.to/getjv/xdebug-3-docker-laravel-vscode-52bi

ENV MOODLE_VERSION=311

RUN mv "${PHP_INI_DIR}/php.ini-production" "${PHP_INI_DIR}/php.ini"

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN echo "xdebug.mode=off" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null && \    
    echo "xdebug.idekey=VSCODE" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null && \
    echo "xdebug.remote_connect_back=1" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null && \
    echo "xdebug.start_with_request=yes" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null && \
    echo "xdebug.discover_client_host=true" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null && \
    echo "xdebug.client_host=host.docker.internal" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini > /dev/null  

    

RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libldap2-dev \
    libfreetype6-dev \
    libpq-dev \
    libzip-dev \
    libonig-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \    
    graphviz \
    libicu-dev \
    libxml2-dev \
    git
    
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \ 
    && docker-php-ext-configure zip  \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure xmlrpc \
    && docker-php-ext-install pgsql pdo_pgsql mbstring zip exif pcntl gd intl xmlrpc soap opcache \
    && docker-php-ext-enable zip intl xmlrpc opcache
    
RUN mkdir /var/www/html/moodledata 

ADD entrypoint.sh /opt/entrypoint.sh
