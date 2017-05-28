#!/bin/bash

envsubst '\$CONTAO_APP_HOST' < /etc/nginx/conf.d/contao.template > /etc/nginx/sites-available/contao

ln -sf /etc/nginx/sites-available/contao /etc/nginx/sites-enabled/contao
rm /etc/nginx/sites-enabled/default

/etc/init.d/nginx restart