#!/bin/bash
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo systemctl start apache2 -y
# sudo systemctl status apache2
sudo chmod 0777 /var/www/html/
sudo chmod 0755 /var/www/html/
sudo chmod 0644 /var/www/html/index.html