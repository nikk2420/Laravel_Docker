# Dockerfile

# Use the official PHP image
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    libicu-dev \
    libzip-dev \
    zlib1g-dev \
    unzip \
    curl \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
    intl \
    pdo \
    pdo_mysql \
    zip

# Install PHP extensions needed for Laravel
# RUN docker-php-ext-install pdo pdo_mysql
# RUN docker-php-ext-install bcmath ctype fileinfo mbstring openssl pdo pdo_mysql tokenizer xml intl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js
RUN apt-get update && \
    apt-get install -y nodejs npm

# Copy application files (this step assumes you have a Laravel project)
COPY . /var/www/html

# Expose port 9000 and start php-fpm
EXPOSE 9000
CMD ["php-fpm"]
