# Manual deployment of Sparta Node app
- [Manual deployment of Sparta Node app](#manual-deployment-of-sparta-node-app)
  - [Dependencies](#dependencies)
  - [Building your database](#building-your-database)
  - [Building your app](#building-your-app)
  - [Running the app](#running-the-app)
  - [Copy and run zipped app using scp](#copy-and-run-zipped-app-using-scp)
  - [Unzip the app code](#unzip-the-app-code)
    - [You need to set the DB\_Host before starting the app](#you-need-to-set-the-db_host-before-starting-the-app)
  - [To run the script](#to-run-the-script)
  - [running database script](#running-database-script)
    - [1. load 3 git bash terminals](#1-load-3-git-bash-terminals)
    - [2. Connect to the database vm first](#2-connect-to-the-database-vm-first)
    - [3.](#3)
    - [4.](#4)
    - [5.](#5)
    - [6.](#6)
    - [7.](#7)


## Dependencies
https://www.mongodb.com/docs/v7.0/tutorial/install-mongodb-on-ubuntu/#std-label-install-mdb-community-ubuntu


## Building your database

## Building your app

## Running the app



## Copy and run zipped app using scp
example of format:
```
scp -i /path/to/key.pem /path/to/file.zip ubuntu@54.12.34.56:home/ubuntu/
```

Use parts from ssh command to login to VM
```
ssh -i ".ssh/tech511-debbie-aws.pem" ubuntu@ec2-34-242-82-127.eu-west-1.compute.amazonaws.com
```

command that worked:
```
scp -i tech511-debbie-aws.pem -r C:\Users\debbi\Downloads\nodejs20-sparta-test-app.zip ubuntu@ec2-54-246-196-44.eu-west-1.compute.amazonaws.com:/home/ubuntu/
```

## Unzip the app code
1. Install unzip (run update first)
   ```
   sudo apt install -y unzip
   ```
2. Unzip the file

### You need to set the DB_Host before starting the app

## To run the script
Please note: You will need 2 git terminals running, one connected to your local machine in the directory of your bash script and the other connected to your virtual machine in the home directory
1. copy script from local machine
   ```
   scp -i /path/to/your-key.pem prov-app.sh ubuntu@EC2_PUBLIC_IP:/home/ubuntu/
   scp -i "C:\Users\debbi\.ssh\tech511-debbie-aws.pem" prov-app.sh ubuntu@3.250.114.43:~ 

   ```

   scp -i "C:\Users\debbi\.ssh\tech511-debbie-aws.pem" prov-db.sh ubuntu@34.247.163.40:~ 
2. SSH into your Virtual Machine
   ```
   ssh -i /path/to/your-key.pem ubuntu@EC2_PUBLIC_IP
   ```
3. make script executable
   ```
   chmod +x prov-app.sh
   ```
4. run script
   ```
   ./prov-app.sh
   ```

## running database script
1. ssh into database
2. run script
3. connect to vm app
4. check posts page





### 1. load 3 git bash terminals
- one for your local machine, you must be in the directory of your bash scripts.
- one for your app virtual machine
- one for your database virtual machine 
### 2. Connect to the database vm first
### 3. 
### 4. 
### 5. 
### 6. 
### 7. 