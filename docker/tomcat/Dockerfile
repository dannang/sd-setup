FROM tomcat:8.0
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

COPY /conf/tomcat-users.xml /usr/local/tomcat/cont/tomcat-users.xml
WORKDIR /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]