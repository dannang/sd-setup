#!/bin/bash

/opt/mssql/bin/sqlservr &

# Wait for database availability
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -S localhost -U sa -P "${SA_PASSWORD}" -Q "select 1"

echo "Database configuration in progress..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -S localhost -U sa -P "${SA_PASSWORD}" -Q "create database ${SQLSERVER_DATABASE};"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -S localhost -U sa -P "${SA_PASSWORD}" -Q "create login ${SQLSERVER_USER} with password = '${SQLSERVER_PASSWORD}', DEFAULT_DATABASE=[${SQLSERVER_DATABASE}];"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -S localhost -U sa -P "${SA_PASSWORD}" -d "${SQLSERVER_DATABASE}" -Q "create user ${SQLSERVER_USER}"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -S localhost -U sa -P "${SA_PASSWORD}" -d "${SQLSERVER_DATABASE}"  -Q "EXEC sp_addrolemember N'db_owner', N'${SQLSERVER_USER}';"

echo "Import the data from the given file"
/opt/mssql/bin/sqlpackage /a:Import /tsn:. /tdn:"${SQLSERVER_DATABASE}" /tu:sa /tp:"${SA_PASSWORD}" /sf:"/usr/src/data/Back-up_Sql_Server.bacpac"

#echo "Export the data to CSV to be used as import for POSTGRESQL"
#/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -S localhost -U sa -P "${SA_PASSWORD}" -d "${SQLSERVER_DATABASE}" -Q "select * from historicaldata.dbo.date" -o "/usr/src/data/Date.csv" -h-1 -s"," -w 700
#/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -S localhost -U sa -P "${SA_PASSWORD}" -d "${SQLSERVER_DATABASE}" -Q "select * from historicaldata.dbo.exchange" -o "/usr/src/data/Exchange.csv" -h-1 -s"," -w 700

wait