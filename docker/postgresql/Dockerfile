FROM postgres:9.6.3
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

ADD /data/create-table.sql /docker-entrypoint-initdb.d/
COPY /bin/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 5432