#!/bin/bash

service php7.3-fpm start
mkdir /etc/nginx/ssl
openssl req -newkey rsa:2048 -x509 -days 365 -nodes -subj "/C=RU/ST=Kazan/L=Kazan/O=21School/OU=budelphi/CN=html" -out /etc/nginx/ssl/html.pem -keyout /etc/nginx/ssl/html.key
