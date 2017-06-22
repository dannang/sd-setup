FROM tomcat:8.0
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

COPY /conf/tomcat-users.xml /usr/local/tomcat/cont/tomcat-users.xml
RUN wget http://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war -P /usr/local/tomcat/webapps
WORKDIR /usr/local/tomcat/webapps

EXPOSE 8080
CMD ["catalina.sh", "run"]