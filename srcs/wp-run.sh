#!/bin/bash

# Перехожу в корень своего 'Сайта'
cd /var/www/html

# Загружает WordPress (основные файлы, ядро)
wp core download --allow-root
# Здесь мы используем команду wp core для добавления данных в базу данных  MySQL WordPress
wp core config --allow-root --dbname=wp_database --dbuser=admin --dbpass=123456 --dbhost=localhost --dbprefix=wp_
# Выполняет стандартный процесс установки WordPress
wp core install --allow-root --url="localhost"  --title="21School" --admin_user="admin" --admin_password="123456" --admin_email="azalia.ff@gmail.com"
