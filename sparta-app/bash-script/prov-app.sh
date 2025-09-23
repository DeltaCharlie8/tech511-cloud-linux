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

# restart nginx
echo restart nginx...
sudo systemctl restart nginx
echo Done!
echo

#configure nginx reverse proxy
echo configure nginx reverse proxy
sudo sed -i 's|try_files \$uri \$uri/ =404;|proxy_pass http://localhost:3000/;|' /etc/nginx/sites-available/default
echo Done!
echo

# restart nginx again
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
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh -y
echo Done!
echo

# Install nodejs
echo Install node js v20...
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y
echo Done!
echo

# get app code using a git clone commmand
echo clone app folder in bash...
git clone https://github.com/DeltaCharlie8/app-code.git
echo Done!
echo

# cd into app folder 
echo cd into app folder...
cd app-code/app
echo Done!
echo

# set env variable
# export DB_HOST=mongodb://<IP-ADDRESS>:27017/posts (THE IP ADDRESS WILL NEED TO BE CHANGED ONCE YOU HAVE THE NEW DB RUNNING)
export DB_HOST=mongodb://34.247.163.40:27017/posts

# run npm install
echo Install npm...
npm install
echo Done!

# install pm2
echo Installing PM2...
sudo npm install pm2 -g
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

