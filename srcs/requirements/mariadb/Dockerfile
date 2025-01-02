FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/
COPY tools/db_script.sh /

CMD ["/db_script.sh"]