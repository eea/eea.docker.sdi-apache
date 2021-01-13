FROM httpd:2.4.46

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get -y update
RUN apt-get -y install \
               vim \
               libapache2-mod-evasive
               #inotify-tools \
               #vim 

ADD httpd.conf /usr/local/apache2/conf/
RUN echo "Include conf/extra/ssl.conf" >> /usr/local/apache2/conf/httpd.conf
RUN rm /etc/ldap/ldap.conf

COPY script_apache_restart.sh /
COPY httpd-foreground /usr/local/bin/httpd-foreground

#RUN chmod a+x /usr/local/bin/httpd-foreground
