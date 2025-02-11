FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx curl openssl

RUN mkdir -p /etc/nginx/ssl && mkdir -p /var/run/nginx
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=PACA/L=Nice/O=42/OU=42/CN=mgayout.42.fr/UID=mgayout"
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html
RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index_de_base_nginx.html
RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]