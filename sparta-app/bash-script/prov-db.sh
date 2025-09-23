#!/bin/bash

# Purpose: Provision MongoDB v7 for Sparta test app
# Testing on: AWS, Ubuntu 22.04 LTS
# Planning for it to work on: New VM and run it multiple times
# Tested by: 
# Tested when: 

# update
echo update...
sudo apt update
echo Done!
echo
 
# upgrade 
echo upgrade...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo Done!
echo

# install gnupg
echo gnupg 
sudo apt-get install gnupg 
echo Done!
echo

# import MongoDB public GPG key
echo install GPG key...
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo Done!
echo 

# create list file
echo Create list file...
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo Done!
echo

# reload package database
echo reload package...
sudo apt-get update
echo Done!
echo

# Install MongoDB server
echo install MongoDB v7 server...
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   mongodb-org=7.0.22 \
   mongodb-org-database=7.0.22 \
   mongodb-org-server=7.0.22 \
   mongodb-mongosh \
   mongodb-org-shell=7.0.22 \
   mongodb-org-mongos=7.0.22 \
   mongodb-org-tools=7.0.22 \
   mongodb-org-database-tools-extra=7.0.22
echo Done!
echo

# use sed command to edit MongoDB config file, change bindIP from 127.0.0.1 to 0.0.0.0
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
echo Done!
echo

# start mongoDB
sudo systemctl start mongod
echo Done!
echo

# enable mongoDB
sudo systemctl enable mongod
echo Done!
echo