FROM microsoft/mssql-server-linux:ctp2-1
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

COPY /bin/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY /bin/import-data.sh /usr/local/bin/import-data.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/import-data.sh

# Sqlserver VM
WORKDIR /sqlserver
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 1433