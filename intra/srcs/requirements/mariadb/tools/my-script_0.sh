#!/bin/bash

ls -la /etc/mysql | grep mariadb # debug
ls -la /etc/mysql/mariadb.conf.d # debug
cat /etc/mysql/mariadb.conf.d/50-server.cnf # debug

if [ -d /var/lib/mysql/$SQL_DB ] ; then
    echo "Database already exists."
else
    service mariadb start

    echo "CREATE DATABASE IF NOT EXISTS \`$SQL_DB\` ;" | mariadb
    echo "CREATE USER IF NOT EXISTS '$SQL_USR'@'%' IDENTIFIED BY '$SQL_PWD' ;" | mariadb
    echo "GRANT ALL PRIVILEGES ON \`$SQL_DB\`.* TO '$SQL_USR'@'%' IDENTIFIED BY '$SQL_PWD' ;" | mariadb

    sleep 1
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PWD' ; FLUSH PRIVILEGES;" | mariadb

    mysqladmin -u"root" -p"$SQL_ROOT_PWD" shutdown
fi

mysqld_safe --bind-address=0.0.0.0
