FROM debian:jessie

ARG USERID=1000
ARG USERNAME=application
ARG CONTAO_APP_HOST=server

MAINTAINER Moave Medien <support@moave.de>

RUN apt-get update && apt-get install -y \
    nginx \
    sudo \
    openssl \
    gettext-base

ADD nginx.conf /etc/nginx/
ADD contao.template /etc/nginx/conf.d/
ADD contao.sh /opt/

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser --gecos "" -q --home /home/${USERNAME} --disabled-password --shell /bin/bash --uid ${USERID} ${USERNAME}

RUN openssl genrsa -des3 -passout pass:x -out /opt/${CONTAO_APP_HOST}.pass.key 2048
RUN openssl rsa -passin pass:x -in /opt/${CONTAO_APP_HOST}.pass.key -out /opt/${CONTAO_APP_HOST}.key
RUN rm /opt/${CONTAO_APP_HOST}.pass.key
RUN openssl req -new -key /opt/${CONTAO_APP_HOST}.key -out /opt/${CONTAO_APP_HOST}.csr \
  -subj "/C=DE/ST=Hamburg/L=Hamburg/O=ContaoDev/OU=IT Department/CN=${CONTAO_APP_HOST}"
RUN openssl x509 -req -days 365 -in /opt/${CONTAO_APP_HOST}.csr -signkey /opt/${CONTAO_APP_HOST}.key -out /opt/${CONTAO_APP_HOST}.crt

CMD ["nginx"]