#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO 'root'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

mysqld