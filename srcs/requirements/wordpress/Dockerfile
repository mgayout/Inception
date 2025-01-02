FROM debian:buster

RUN apt-get update && apt-get install php7.3 php-fpm php-mysql wget -y

COPY conf/wordpress.conf /
COPY tools/wd_script.sh /

ENTRYPOINT [ "wd_script.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]