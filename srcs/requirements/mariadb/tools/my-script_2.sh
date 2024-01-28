#!/bin/bash

# 1. Start MariaDB service
service mariadb start

# 2. Create database, user, and grant privileges
echo "CREATE DATABASE IF NOT EXISTS \`$SQL_DB\` ;" | mariadb
echo "CREATE USER IF NOT EXISTS '$SQL_USR'@'%' IDENTIFIED BY '$SQL_PWD' ;" | mariadb
echo "GRANT ALL PRIVILEGES ON \`$SQL_DB\`.* TO '$SQL_USR'@'%' IDENTIFIED BY '$SQL_PWD' ;" | mariadb

sleep 1
# 3. Set root user password and flush privileges
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PWD' ; FLUSH PRIVILEGES;" | mariadb

# Shutdown MySQL server
mysqladmin -u"root" -p"$SQL_ROOT_PWD" shutdown

# Start MySQL in safe mode with a specific bind address
mysqld_safe --bind-address=0.0.0.0

# exec mysqld_safe
