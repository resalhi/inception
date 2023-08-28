FROM alpine:3.14

RUN apk update

RUN apk add php7 \
    php7-fpm \
    php7-mysqli \
    php7-phar \
    curl \
    composer \
    && sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php7/php-fpm.d/www.conf

COPY requirements/wordpress/conf/wp-config-create.sh .

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "/./wp-config-create.sh"]
