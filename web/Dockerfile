FROM centos:centos8

RUN yum -y update  
RUN yum -y install \
        httpd php php-mysqlnd
RUN systemctl enable httpd
RUN chkconfig httpd on
RUN yum -y install nano
RUN yum -y install mysql 

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY index.php /var/www/html/index.php
COPY insert.php /var/www/html/insert.php
COPY query.php /var/www/html/query.php

EXPOSE 80 443 3306

CMD [ "/usr/sbin/httpd", "-DFOREGROUND" ]