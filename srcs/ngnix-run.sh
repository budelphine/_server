#!/bin/bash

ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
