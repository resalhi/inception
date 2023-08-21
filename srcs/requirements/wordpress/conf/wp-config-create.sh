#!bin/sh

wget https://wordpress.org/latest.zip && unzip latest.zip && cp -rf wordpress/* . && rm -rf wordpress latest.zip

# mv wp-config-sample.php wp-config.php

cat << EOF > wp-config.php
    <?php
    define( 'DB_NAME', '${DB_NAME}' );
    define( 'DB_USER', '${DB_USER}' );
    define( 'DB_PASSWORD', '${DB_PASS}' );
    define( 'DB_HOST', 'mariadb' );
    define( 'DB_CHARSET', 'utf8' );
    define( 'DB_COLLATE', '' );
    define('FS_METHOD','direct');
    \$table_prefix = 'wp_';
    define( 'WP_DEBUG', false );
    if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );}
    require_once ABSPATH . 'wp-settings.php';
EOF

# sed -i -r "s/database_name_here/$DB_NAME/1" wp-config.php
# sed -i -r "s/username_here/$DB_USER/1"       wp-config.php
# sed -i -r "s/password_here/$DB_PASS/1"        wp-config.php

sed -i -r "s/localhost/mariadb/1"    wp-config.php 

/usr/sbin/php-fpm8 -F -R