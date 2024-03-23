FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www

# Timezone
ENV TZ Asia/Ho_Chi_Minh

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        zip \
        unzip \
        curl

RUN docker-php-ext-install mysqli pdo pdo_mysql

# Clear cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Grant permissions
RUN chown -R www-data:www-data /var/www
RUN usermod -u 1000 www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
