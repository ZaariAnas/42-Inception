#!bin/bash

#debug logs
set -x

#file configs edit
sed -i 's/# port = 3306/ port = 3306/' /etc/mysql/mariadb.cnf
sed -i 's/127.0.0.1/0.0.0.0/1' /etc/mysql/mariadb.conf.d/50-server.cnf

#starting database service
service mariadb start

#creating database and user
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

#stop
service mariadb stop

mariadbd