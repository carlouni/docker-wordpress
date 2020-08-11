FROM ubuntu:18.04
RUN apt-get update
RUN apt-get -y install sudo

# disable interactivity
ENV DEBIAN_FRONTEND=noninteractive

# Apache server
RUN apt-get install -y apache2

# Set up PHP
RUN apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-mbstring php7.2-gd php7.2-intl php7.2-xml php7.2-mysql php7.2-zip php7.2-bcmath php7.2-curl

RUN apt-get install -y iptables

# Enable apache mods.
RUN a2enmod php7.2
RUN a2enmod rewrite

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.2/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.2/apache2/php.ini

#set user
RUN adduser www-data sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD apache-php7.conf /etc/apache2/sites-available/apache-php7.conf
RUN a2dissite 000-default
RUN a2ensite apache-php7

# Manually set up the apache environment variables
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ADD init.sh /home/ubuntu/init.sh

ENTRYPOINT ["sh", "/home/ubuntu/init.sh"]