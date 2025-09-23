#!/bin/bash

# cd into repo folder
cd /home/ubuntu/app-code/app

# change IP address for database
export DB_HOST=mongodb://34.247.163.40:27017/posts

# start the app
pm2 start app.js