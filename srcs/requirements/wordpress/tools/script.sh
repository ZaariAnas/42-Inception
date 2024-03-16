#!bin/sh

set -x

#setup a working dir for wordpress
mkdir -p /var/www/wordpress

#setup wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|1' /etc/php/7.4/fpm/pool.d/www.conf
mv wp-cli.phar /usr/local/bin/wp

service php7.4-fpm start

#setup for wordpress
wp core download --allow-root --path='/var/www/wordpress' --force
wp config create --dbname=$DB_NAME --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASS --dbhost=mariadb --path='/var/www/wordpress' --allow-root
wp core install --url=$WP_URL --title="$WP_TITLE" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress' --allow-root
wp user create $NEW_USER_NAME $NEW_USER_EMAIL --role=$NEW_USER_ROLE --user_pass=$NEW_USER_PASSWORD --path='/var/www/wordpress' --allow-root

service php7.4-fpm stop

php-fpm7.4 -F