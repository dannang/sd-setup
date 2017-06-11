FROM microsoft/mssql-server-linux:ctp2-1
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

COPY /bin/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Sqlserver VM
WORKDIR /sqlserver
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
WIP 
EXPOSE 1433