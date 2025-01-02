FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

EXPOSE 443

COPY conf/nginx.conf /etc/nginx/sites-enabled/default
COPY tools/ng_script.sh /var/www

RUN chmod +x /var/www/ng_script.sh

ENTRYPOINT [ "var/www/ng_script.sh" ]

CMD ["nginx", "-g", "daemon off;"]