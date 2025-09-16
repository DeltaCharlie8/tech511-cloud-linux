#!/bin/bash

# update
sudo apt update

# upgrade - asks for user input - FIX!
sudo apt upgrade

# install nginx - asks for user input - FIX!
sudo apt install nginx

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo systemd-sysv-install enable nginx