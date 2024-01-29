#!/bin/bash

SQL_DB="$MYSQL_DATABASE"
SQL_USR="$MYSQL_USER"
SQL_PWD="$MYSQL_PASSWORD"
SQL_ROOT_PWD="$MYSQL_ROOT_PASSWORD"

# Start MySQL service
service mysql start

sleep 1

# Create database and user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USR}\`@'localhost' IDENTIFIED BY '${SQL_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USR}\`@'%' IDENTIFIED BY '${SQL_PWD}';"

sleep 1

# Set root user password and flush privileges
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"
mysql -e "FLUSH PRIVILEGES;"

# Shutdown MySQL server
mysqladmin -u root -p$SQL_ROOT_PWD shutdown

# Start MySQL in safe mode with a specific bind address
# mysqld_safe --bind-address=0.0.0.0

exec mysqld_safe 
