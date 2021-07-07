#!/bin/bash

sed -i 's/autoindex off/autoindex on/g' /etc/ngnix/sites-available/default
service ngnix stop
service ngnix start