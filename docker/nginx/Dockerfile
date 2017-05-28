FROM debian:jessie

MAINTAINER Moave Medien <support@moave.de>

RUN apt-get update && apt-get install -y \
    nginx \
    gettext-base

ADD nginx.conf /etc/nginx/
ADD contao.template /etc/nginx/conf.d/
ADD contao.sh /opt/

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf
RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443