#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;
echo "Wordpress: setting up..."
mkdir -p /var/www/html
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar; 
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html;
wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/
echo "Wordpress: creating users..."
wp core install --allow-root --url=${DOMAIN_NAME} --title=${SQL_DATABASE} --admin_user=${SQL_ROOT_USER} --admin_password=${SQL_ROOT_PASSWORD}
wp user create --allow-root ${SQL_USER} --user_pass=${SQL_PASSWORD};
echo "Wordpress: set up!"