FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=password 
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=password 

COPY quote-sql-table.sql /docker-entrypoint.initdb.d/

EXPOSE 3306