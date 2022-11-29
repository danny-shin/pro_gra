FROM php:7.0.33-apache


# Add reposotiries -- Composer, Nodejs
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    supervisor \
    nodejs \
    npm \
    net-tools \
    glances \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
    
# RUN apt-get install -y vim

# RUN apt-get install -y nodejs && apt-get install -y npm

# RUN npm install -g -y n && n latest

# Clear cache
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# RUN docker-php-ext-install     php8   php8-fpm  php8-pdo  php8-pdo_mysql  php8-mysqli  php8-mcrypt php8-mbstring 
# Install php extensions
# RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN docker-php-ext-install pdo_mysql
# RUN docker-php-ext-install pdo_mysql zip exif pcntl
# RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
# RUN docker-php-ext-install gd

COPY ./docker/web/000-default.conf /etc/apache2/sites-available/
COPY ./docker/web/ports.conf /etc/apache2/ports.conf
COPY ./docker/web/supervisor /etc/supervisor

WORKDIR /var/www/gpsv3

COPY . /var/www/gpsv3

RUN a2enmod rewrite

RUN chmod -R guo+w storage

RUN composer install && npm install
# RUN service supervisor start

# RUN php artisan key:generate && php artisan config:clear && php artisan cach:clear && php artisan view:clear
# RUN php artisan key:generate && php artisan optimize

# RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

# RUN php artisan migrate

# CMD php artisan serve --host=0.0.0.0 --port=8000

# EXPOSE 8000