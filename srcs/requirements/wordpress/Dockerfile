FROM alpine:3.14

RUN apk update && apk upgrade

RUN apk add php7 \
    php7-fpm \
    php7-mysqli \
    php7-pdo_mysql \
    php7-phar \
    php7-json \
    php7-openssl \
    php7-curl \
    php7-zlib \
    php7-mbstring \
    wget \
    curl \
    composer \
    unzip && sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php7/php-fpm.d/www.conf

COPY requirements/wordpress/conf/wp-config-create.sh .

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "/./wp-config-create.sh"]
