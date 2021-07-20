FROM ubuntu:20.10

RUN apt-get update \
	&& apt-get install software-properties-common -y \
	&& apt-add-repository ppa:ondrej/php
RUN	apt-get update \
	&& apt-get install tzdata -y 
RUN	apt-get install php8.0 libapache2-mod-php8.0 php8.0-bcmath php8.0-bz2 php8.0-cli php8.0-common php8.0-curl php8.0-gd php8.0-imagick php8.0-intl php8.0-mbstring php8.0-mcrypt php8.0-mysql php8.0-soap php8.0-redis php8.0-xml -y \
	&& apt-get install nano -y


#COPY httpd-php-backup.sh /scripts
#COPY httpd.conf /etc/httpd/conf
# COPY vhost.conf /etc/apache2/sites-available
#COPY php.ini /etc/php.ini

# RUN a2ensite vhost.conf \
# 	&& a2dissite 000-default.conf

# RUN a2enmod php8.0
# RUN a2enmod rewrite

# RUN service apache2 start

#WORKDIR /scripts

#RUN chmod +x httpd-php-backup.sh

#CMD ["./httpd-php-backup.sh"]

# RUN service apache2 restart

# ENTRYPOINT ["/sbin/httpd", "-D", "FOREGROUND"]
