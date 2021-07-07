#!/bin/bash

sed -i 's/autoindex on/autoindex off/g' /etc/ngnix/sites-available/default
service ngnix stop
service ngnix start