#!/bin/bash

if [ `ls -1A /app | wc -l` -eq 0 ]; then
    curl -L https://github.com/contao/standard-edition/archive/${CONTAO_VERSION}.tar.gz | tar -xzp --no-same-owner -C /app --strip-components=1
    envsubst '\$MYSQL_DATABASE \$MYSQL_USER \$MYSQL_PASSWORD \$MYSQL_HOST \$MYSQL_PORT' < /opt/parameters.yml.template > /app/app/config/parameters.yml
    composer install -d /app
    chown -R www-data:www-data /app
fi