#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
mkdir -p /var/www/html
sudo chown www-data: /var/www
sudo systemctl start && enable apache2
sudo curl -L -o "/var/www/html/index.html" https://raw.githubusercontent.com/stpn77/aws-deploy-server/main/index.html
