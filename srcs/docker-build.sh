#!/bin/bash

# docker build - Собираем 'Образ/image' в Docker
# -t - флаг который задает имя нашему образу

# container run - запускает контейнер по выбранному образу
# -d - запустить контейнер в фоне
# -p - соединение портов внутри докера и во внешке 1 - внешка, 2 - внутри докера

docker build -t ft_server_by_budelphi .. && docker container run -p 80:80 -p 443:443 -ti ft_server_by_budelphi 
