#Nginx Dockerfile


#Pull base image


FROM debian

#Install Nginx

RUN apt-get update && apt-get install -y  software-properties-common

RUN apt-get install -y nginx openssh-server

RUN /etc/init.d/ssh restart

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

STOPSIGNAL SIGTERM

# Define default command.
CMD /bin/sh -C /etc/init.d/ssh restart && nginx -g "daemon off;"

# Expose ports.
EXPOSE 80
EXPOSE 22
