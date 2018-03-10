# Base image : official latest ubuntu
FROM ubuntu

# Maintainer name
LABEL MAINTAINER KHELIL Hamdi <khelilhamdi@gmail.com>

# Environement variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/web/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

# Command to run to provision our container
RUN export DEBIAN_FRONTEND=noninteractive &&  \
    apt-get update && \
    apt-get -y -q upgrade && \
    apt-get -y -q install apache2

# ports to expose
EXPOSE 80 443

# Default command to launch
ENTRYPOINT ["apache2ctl"]

# command options
CMD ["-D","FOREGROUND"]
