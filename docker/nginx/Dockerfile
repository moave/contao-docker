FROM debian:jessie

ARG USERID=1000
ARG USERNAME=application

MAINTAINER Moave Medien <support@moave.de>

RUN apt-get update && apt-get install -y \
    nginx \
    sudo \
    gettext-base

ADD nginx.conf /etc/nginx/
ADD contao.template /etc/nginx/conf.d/
ADD contao.sh /opt/

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser --gecos "" -q --home /home/${USERNAME} --disabled-password --shell /bin/bash --uid ${USERID} ${USERNAME}

CMD ["nginx"]