# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: budelphi <budelphi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/17 18:53:10 by budelphi          #+#    #+#              #
#    Updated: 2021/02/21 18:22:33 by budelphi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Получаем debian-buster с DockerHub
FROM debian:buster

# Обновление данных о доступных в репозиториии программах
# И обновление установленных пакетов
RUN apt-get -y update && apt-get -y upgrade

# Устанавливаем нужные программы в дополнение к стандартным
# Накатываю ngnix, openssl, db
# Стандартная установка php7.3; fpm - нужен для работы с более ранними версиями
# Supervisor нужен, чтобы работа контейнера не прерывалась
RUN apt-get install -y wget unzip vim curl mc procps nano
RUN apt-get install -y nginx openssl mariadb-server 
RUN apt-get install -y php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd  php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json

# Перемещаю все скрипты в корень
COPY ./srcs/run.sh ./
COPY ./srcs/ssl-run.sh ./
COPY ./srcs/ngnix-run.sh ./
COPY ./srcs/nginx.conf /etc/nginx/sites-available/
COPY ./srcs/mysql-run.sh ./
COPY ./srcs/wp-run.sh ./
COPY ./srcs/pma-run.sh ./
COPY ./srcs/disable_autoindex.sh ./
COPY ./srcs/enable_autoindex.sh ./

# MyAdmin download
RUN bash pma-run.sh
COPY ./srcs/phpmyadmin.inc.php /var/www/html/phpmyadmin/

# WP-CLI download
COPY ./srcs/wpcli-run.sh ./
RUN bash wpcli-run.sh

# Начинаем
CMD bash run.sh

# Необходимо, чтобы во внешнем интерфейсе Docker
# можно было легко протыкать нужные порты
EXPOSE 80 443
