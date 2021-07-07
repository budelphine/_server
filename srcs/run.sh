#!/bin/bash

echo "------------------------------"
echo "---> Docker container run <---"
echo "------------------------------"

# SSL
bash ssl-run.sh

# Ngnix
bash ngnix-run.sh

# Service
service nginx start && service mysql start && service php7.3-fpm restart

# MySQL
bash mysql-run.sh

# WP
bash wp-run.sh

bash