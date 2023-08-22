#!bin/sh

sleep 4

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

chmod -R 777 /var/www/

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv wp-config-sample.php wp-config.php

sed -i -r "s/database_name_here/$DB_NAME/1" wp-config.php
sed -i -r "s/username_here/$DB_USER/1" wp-config.php
sed -i -r "s/password_here/$DB_PASS/1" wp-config.php
sed -i -r "s/localhost/mariadb/1" wp-config.php

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_TITLE --admin_password=$DB_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $DB_USER $WP_ADMIN_EMAIL --role=author --user_pass=$DB_PASS --allow-root

/usr/sbin/php-fpm8 -F -R

rm wp-config-create.sh
