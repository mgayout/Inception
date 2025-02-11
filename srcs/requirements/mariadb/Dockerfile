FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install mariadb-server sudo -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/init_db.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/init_db.sh

ENTRYPOINT ["sh", "/usr/local/bin/init_db.sh"]