FROM ubuntu:16.04
MAINTAINER Ciao Chung

ARG MYSQL_ROOT_PASSWORD
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG MYSQL_PWD
ENV MYSQL_PWD=${MYSQL_PWD}

ENV DEBIAN_FRONTEND noninteractive

## php
RUN apt-get update
RUN apt-get install -y --assume-yes apt-utils net-tools iputils-ping
RUN apt-get install -y software-properties-common curl wget vim net-tools
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install -y php7.1 php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-gd php7.1-zip php7.1-dom php7.1-xml php7.1-curl
RUN apt-get install -y libapache2-mod-php7.1
RUN apt-get install -y php-imagick
RUN php -m | grep imagick
RUN apt-get update

# mysql
RUN apt-get update
RUN echo "mysql-server mysql-server/root_password password ${MYSQL_ROOT_PASSWORD}" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password ${MYSQL_ROOT_PASSWORD}" | debconf-set-selections
RUN apt-get install mysql-server-5.7 -y && mysql --version
RUN chmod -R 755 /var/lib/mysql

# phpmyadmin
RUN echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/app-password-confirm password ${MYSQL_ROOT_PASSWORD}" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/mysql/admin-pass password ${MYSQL_ROOT_PASSWORD}" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
RUN apt-get install phpmyadmin -y
RUN echo "\$cfg['PmaNoRelation_DisableWarning'] = 'true';" >> /etc/phpmyadmin/config.inc.php
RUN a2enmod rewrite
RUN echo "MYSQL_ROOT_PASSWORD -> ${MYSQL_ROOT_PASSWORD}"

EXPOSE 80 443 22

CMD ["sh", "-c", "service apache2 restart && service mysql restart && tail -f /dev/null"]