#!/bin/bash

/opt/mssql/bin/sqlservr &

# Wait for database availability
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -S localhost -U SA -P "${SA_PASSWORD}" -Q "select 1"

echo "Database configuration in progress..."

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -S localhost -U SA -P "${SA_PASSWORD}" -Q "create database ${SQLSERVER_DATABASE};"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -S localhost -U SA -P "${SA_PASSWORD}" -Q "create login ${SQLSERVER_USER} with password = '${SQLSERVER_PASSWORD}', DEFAULT_DATABASE=[${SQLSERVER_DATABASE}];"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -S localhost -U SA -P "${SA_PASSWORD}" -d "${SQLSERVER_DATABASE}" -Q "create user ${SQLSERVER_USER}"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -S localhost -U SA -P "${SA_PASSWORD}" -d "${SQLSERVER_DATABASE}"  -Q "EXEC sp_addrolemember N'db_owner', N'${SQLSERVER_USER}';"

echo "Database started"