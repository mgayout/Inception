#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

mysql_install_db --user=mysql --datadir=/var/lib/mysql >> /dev/null
/usr/bin/mysqld_safe --datadir=/var/lib/mysql &

while true; do
    if /usr/bin/mysqladmin ping --silent; then
        echo "MySQL is online"
        break
    fi
    sleep 1
done

if [ -n "$DB_NAME" ]; then
    echo "Checking if $DB_NAME already exists"
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    if [ -n "$DB_USER" ] && [ -n "$DB_PASSWORD" ]; then
        echo "Checking if $DB_USER already exists..."
        mysql -u root -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
        echo "Granting privileges to $DB_USER on $DB_NAME"
        mysql -u root -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
        echo "Flushing privileges..."
        mysql -u root -e "FLUSH PRIVILEGES;"
    fi
fi

wait
