FROM nginx:1.11
MAINTAINER Dana Negrescu <dana.negrescu@evozon.com>

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/sites-enabled/default.conf /usr/local/bin/nginx/sites-enabled/default.conf
COPY ./bin/start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

WORKDIR /var/www/magento
EXPOSE 80

CMD ["/usr/local/bin/start.sh"]