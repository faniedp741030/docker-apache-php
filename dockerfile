FROM centos:7
RUN yum -y install httpd

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN yum --enablerepo=remi-php73 -y install php php-bcmath php-cli php-common php-gd php-intl php-ldap php-mbstring \
    php-mysqlnd php-pear php-soap php-xml php-xmlrpc php-zip

RUN echo "<?php phpinfo();?>" > /var/www/html/index.php


CMD ["/usr/sbin/httpd","-D", "FOREGROUND"]
EXPOSE 80
