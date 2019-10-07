FROM httpd:2.4.41

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get -y update
RUN apt-get -y install \
               inotify-tools \
               vim

RUN sed -i '/LoadModule rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule http2_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule ldap_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule ssl_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule proxy_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
 
RUN sed -i '/LoadModule proxy_http_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule authnz_ldap_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule mod_auth_basic/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule authn_core_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule auth_basic_module/s/^#//g' /usr/local/apache2/conf/httpd.conf 


#RUN sed -i '/LoadModule mod_access_compat/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule mod_ldap/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN echo "Include conf/extra/ssl.conf" >> /usr/local/apache2/conf/httpd.conf

RUN rm /etc/ldap/ldap.conf && \
    touch /etc/ldap/ldap.conf && \
    mkdir -p /var/log/apache2

COPY inotify_apache_restart.sh /
COPY httpd-foreground /usr/local/bin/httpd-foreground
RUN chmod a+x /usr/local/bin/httpd-foreground
