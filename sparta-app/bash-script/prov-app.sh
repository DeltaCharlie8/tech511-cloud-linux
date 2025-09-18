#!/bin/bash

# Testing on: AWS, Ubuntu 22.04 LTS
# Planning for it to work on: New VM and run it multiple times
# Tested by: 
# Tested when: 

echo update...
sudo apt update
echo Done!
echo
 
# upgrade 
echo upgrade...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo Done!
echo

# install nginx 
echo install nginx..
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo Done!
echo

# configure nginx

echo restart nginx...
sudo systemctl restart nginx
echo Done!
echo

# nodejs install
echo download script to install node.js v20...
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
echo Done!
echo


# run script to install nodejs
echo run script to update things to install node js v20... 
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh
echo Done!
echo

# Install nodejs
echo Install node js v20...
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs 
echo Done!
echo

# update again
echo update...
sudo apt update
echo Done!
echo

# set env
# export DB_HOST=mongodb://<IP-ADDRESS>:27017/posts
export DB_HOST=mongodb://54.155.16.84:27017/posts

# get app code using a git clone commmand
echo clone app folder in bash...
sudo git clone https://github.com/DeltaCharlie8/app-code.git
echo Done!
echo

# cd into app folder 
echo cd into app folder...
cd app-code/app
echo Done!
echo

# run npm install
echo Install npm...
sudo npm install
echo Done!

# update again
echo update...
sudo apt update
echo Done!
echo

# install pm2
echo Installing PM2...
sudo npm install pm2@latest -g
echo Done!
echo

#stop app running in the background with pm2 
echo Stopping pm2...
pm2 stop app --name sparta-app
echo Done!
echo

# run app in the background with pm2
echo Starting up the app...
pm2 start app.js
echo Done!
echo