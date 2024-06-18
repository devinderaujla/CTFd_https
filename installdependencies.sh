#!/usr/bin/env bash
apt update
apt install docker curl wget git -y
curl -L https://github.com/docker/compose/releases/download/1.11.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo openssl dhparam -out ./conf/nginx/cert/dhparam.pem 2048
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./conf/nginx/cert/nginx-selfsigned.key -out ./conf/nginx/cert/nginx-selfsigned.crt
print f "\n If you continue then this script will launch docker-compose up command. If you dont wish to continue, press CTRL+C \n"
pause
sudo docker-compose up
