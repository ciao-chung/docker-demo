FROM mysql:5.7
MAINTAINER Ciao Chung

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN chmod -R 755 /var/lib/mysql/
RUN echo "skip-grant-tables" >> /etc/mysql/mysql.conf.d/mysqld.cnf
EXPOSE 3306

CMD ["sh", "-c", "service mysql restart && tail -f /dev/null"]