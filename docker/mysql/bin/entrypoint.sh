#!/bin/bash

mysqld

mysql -u root -e "SHOW DATABASES"

mysql -u $MYSQL_USER -p $MYSQL_PASSWORD < "/usr/src/setup/create-table.sql"
