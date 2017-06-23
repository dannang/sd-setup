FROM nginx:1.11
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

COPY ./conf/sites-enabled/sd2017.dev.conf /usr/local/bin/nginx/sites-enabled/sd2017.dev.conf

WORKDIR /usr/local/tomcat/webapps/web
EXPOSE 80