# Dockerfile

# Use the official PHP image
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl

# Install PHP extensions needed for Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy application files (this step assumes you have a Laravel project)
COPY . /var/www/html

# Expose port 9000 and start php-fpm
EXPOSE 9000
CMD ["php-fpm"]
