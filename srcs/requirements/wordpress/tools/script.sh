#!bin/bash

set -x

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    mkdir -p /var/www/wordpress
    wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp
    cd /var/www/wordpress
    wp core download --allow-root --force
    wp config create --dbname="$DB_NAME" --dbuser="$DB_USER_NAME" --dbpass="$DB_USER_PASS" --dbhost="$DB_HOST" --allow-root
    wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_REG_USER $WP_REG_USER_EMAIL --role="$WP_REG_USER_ROLE" --user_pass="$WP_REG_USER_PASS" --allow-root
fi

php-fpm7.4 -F