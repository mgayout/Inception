FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install php7.3 php-fpm php-mysql wget mariadb-client bash gettext-base -y

RUN	mkdir -p /etc/conf/ && mkdir -p /run/php && chown www-data:www-data /run/php && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv -f wp-cli.phar /usr/local/bin/wp

RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
	chown -R www-data:www-data /var/www/wordpress

COPY /tools/wp.sh /etc/conf/
COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x /etc/conf/wp.sh

CMD ["sh", "/etc/conf/wp.sh"]
