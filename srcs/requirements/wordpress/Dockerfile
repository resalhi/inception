FROM alpine:3.16

RUN apk update && apk upgrade

RUN apk add php8 \
    php8-fpm \
    php8-mysqli \
    php8-json \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fileinfo \
    php8-mbstring \
    php8-openssl \
    php8-xml \
    php8-zip \
    wget \
    curl \
    composer \
    unzip; \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf; \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php8/php-fpm.d/www.conf; \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php8/php-fpm.d/www.conf

WORKDIR /var/www

EXPOSE 9000

COPY requirements/wordpress/conf/wp-config-create.sh .

CMD ["sh", "wp-config-create.sh"]
