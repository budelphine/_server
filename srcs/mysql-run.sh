#!/bin/bash


echo "CREATE DATABASE myDB;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON myDB.* TO 'admin'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY '123456';" | mysql -u root --skip-password
echo "CREATE DATABASE wp_database;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wp_database.* TO 'admin'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
