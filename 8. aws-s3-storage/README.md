# AWS S3 Storage

- [AWS S3 Storage](#aws-s3-storage)
  - [What is S3 Storage?](#what-is-s3-storage)
  - [AWS S3 Code Along: installing AWS Command Line](#aws-s3-code-along-installing-aws-command-line)

## What is S3 Storage?
Simple Storage Service
- used to store and retrieve any amount of data at any time whenever you need it, accessible from around the globe.
- can be configured easily to host a static website.
- has built in redundancy by default, 3 copies kept with 1 in each availability zone.
- access it many ways including CLI

## AWS S3 Code Along: installing AWS Command Line
1. ssh into vm
```
ssh -i "tech511-debbie-aws.pem" ubuntu@ec2-<ip_address>.eu-west-1.compute.amazonaws.com
```
2. update and upgrade
```
sudo apt-get update
sudo upgrade
```
3. install pip
```
sudo apt-get install pip
```
4. install aws cli
```
sudo pip install awscli
```
5. aws configure
```
aws configure
```
6. input access id and key details
7. clear screen to avoid exposing sensitive data
```
clear
```
8. here buckets are containers (folders) for your files
9.  aws s3 help for for more information
```
aws s3 help
```
10. make a bucket
```
aws s3 mb s3://tech511-debbie-first-bucket 
```
11. check your bucket (ls)
```
aws s3 ls s3://tech511-debbie-first-bucket/
```
12. run command to create a test file
```
echo This is a test file! > test.txt
```
13. print file to screen
```
cat test.txt
```
14. copy the text file over to your bucket
```
aws s3 cp test.txt s3://tech511-debbie-first-bucket
``` 
15. check file has been added to the bucket
```
aws s3 ls s3://tech511-debbie-first-bucket
```
16. make a directory called downloads
```
mkdir downloads
```
17. cd into downloads
```
cd downloads
```
18. download a file from the bucket
```
aws s3 sync s3://tech511-debbie-first-bucket .
```
19. deleting a file from a bucket
```
aws s3 rm s3://tech511-debbie-first-bucket/test.txt
```
20. delete everything from a bucket (NOT RECOMMENDED)❗
```
aws s3 rm s3://tech511-debbie-first-bucket --recursive
```
21.  delete a bucket that is empty (NOT RECOMMENDED)❗
```
aws s3 rb s3://tech511-debbie-first-bucket
```
22. delete a bucket that is not empty (NOT RECOMMENDED DOES SO WITHOUT WARNING)❗
```
aws s3 rb s3://tech511-debbie-first-bucket --FORCE
```