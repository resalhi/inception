#!bin/sh

sleep 2

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x /var/www/html/wp-cli.phar

mv /var/www/html/wp-cli.phar /usr/local/bin/wp

wp core download --force --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/$DB_NAME/1" /var/www/html/wp-config.php
sed -i "s/username_here/$DB_USER/1" /var/www/html/wp-config.php
sed -i "s/password_here/$DB_PASS/1" /var/www/html/wp-config.php
sed -i "s/localhost/mariadb/1" /var/www/html/wp-config.php

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_TITLE --admin_password=$DB_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $DB_USER $WP_ADMIN_EMAIL --role=author --user_pass=$DB_PASS --allow-root

/usr/sbin/php-fpm7 -F -R
