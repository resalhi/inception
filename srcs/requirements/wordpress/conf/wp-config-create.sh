#!bin/sh

wget https://wordpress.org/latest.zip && unzip latest.zip && cp -rf wordpress/* . && rm -rf wordpress latest.zip

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --force --allow-root  --version=5.8.1 --locale=en_US

mv wp-config-sample.php wp-config.php

sed -i -r "s/database_name_here/$DB_NAME/1" wp-config.php
sed -i -r "s/username_here/$DB_USER/1"       wp-config.php
sed -i -r "s/password_here/$DB_PASS/1"        wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php 

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_TITLE --admin_password=$DB_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $DB_USER $WP_ADMIN_EMAIL --role=author --user_pass=$DB_PASS --allow-root

/usr/sbin/php-fpm8 -F -R
