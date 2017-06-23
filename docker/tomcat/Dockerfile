FROM tomcat:8.0
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

COPY /conf/tomcat-users.xml /usr/local/tomcat/cont/tomcat-users.xml
COPY /conf/server.xml  /usr/local/tomcat/conf/server.xml

WORKDIR /usr/local/tomcat/webapps/web

EXPOSE 8080
CMD ["catalina.sh", "run"]