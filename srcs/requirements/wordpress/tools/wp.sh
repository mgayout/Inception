#!/bin/bash

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

if [ -n "$DB_NAME" ]; then
	sed -i "s|define( 'DB_NAME', 'votre_nom_de_bdd' );|define( 'DB_NAME', '$DB_NAME' );|" /var/www/wordpress/wp-config.php
	if [ -n "$DB_USER" ]; then
		sed -i "s|define( 'DB_USER', 'votre_utilisateur_de_bdd' );|define( 'DB_USER', '$DB_USER' );|" /var/www/wordpress/wp-config.php
		if [ -n "$DB_PASSWORD" ]; then
    		sed -i "s|define( 'DB_PASSWORD', 'votre_mdp_de_bdd' );|define( 'DB_PASSWORD', '$DB_PASSWORD' );|" /var/www/wordpress/wp-config.php
		fi
	fi
fi

sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb' );/" /var/www/wordpress/wp-config.php

until wp db check --allow-root --path=/var/www/wordpress; do
    sleep 5
    echo "Retrying..."
done

wp core install --allow-root --path=$WP_PATHWORDPRESS --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMINUSER --admin_password=$WP_ADMINPASSWORD --admin_email=$WP_ADMINEMAIL

wp user create --allow-root $WP_USER $WP_USEREMAIL --path=$WP_PATHWORDPRESS --role=$WP_ROLE --user_pass=$WP_USERPASSWORD --display_name=$WP_DISPLAYNAME


wp option update home "http://localhost" --path=/var/www/wordpress --allow-root
wp option update siteurl "http://localhost" --path=/var/www/wordpress --allow-root

/usr/sbin/php-fpm7.4 -F