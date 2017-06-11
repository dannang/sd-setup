FROM microsoft/mssql-server-linux:ctp2-1
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

WORKDIR /tmp

# Sqlserver VM
WORKDIR /sqlserver

COPY bin/entrypoint.sh entrypoint.sh
RUN chmod u+x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE 1433