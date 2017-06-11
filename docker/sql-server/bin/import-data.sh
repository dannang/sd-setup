#!bin/bash

#wait for the SQL Server to come up
sleep 90s

#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa  -S localhost -U sa -P "${SA_PASSWORD}" -i /usr/src/data/create-table.sql

#import the data from the given file
/opt/mssql-tools/bin/bcp historicaldata.dbo.date in "/usr/src/data/Date.BCP" -c -S localhost -U sa -P "${SA_PASSWORD}"
#/opt/mssql-tools/bin/bcp historicaldata.dbo.date in "/usr/src/data/Date.csv" -c -t',' -S localhost -U sa -P "${SA_PASSWORD}"
#/opt/mssql-tools/bin/bcp historicaldata.dbo.exchange in "/usr/src/data/Exchange.csv" -c -t',' -S localhost -U sa -P "${SA_PASSWORD}"