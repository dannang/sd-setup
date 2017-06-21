#!/bin/bash

/etc/init.d/postgresql start
#service /etc/init.d/postgresql status

echo " * * * * * CREATING DATABASE & TABLES* * * * * * "
psql -U $POSTGRES_USER -a -f "/usr/src/setup/create-table.sql"

echo "Import data from CSV files"
#psql -U $POSTGRES_USER -d $POSTGRES_DB -c "\COPY exchange FROM '/usr/src/data/Exchange.csv' DELIMITER ',' CSV;" // the table is empty either way
psql -U $POSTGRES_USER -d $POSTGRES_DB -c  "\COPY public.data FROM '/usr/src/data/Date.csv' DELIMITER ',' CSV;"

echo "* * * DATABASE IS READY TO USE! * * *"
/etc/init.d/postgresql status

wait