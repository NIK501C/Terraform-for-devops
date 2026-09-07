#!/bin/bash

sudo apt update 
sudo apt upgrade
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx

echo "<h1> nginx installed successfully </h1>" | sudo tee /var/www/html/index.html