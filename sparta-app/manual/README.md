# Manual deployment of Sparta Node app

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


## To run the script
1. copy script from local machine
   ```
   scp -i /path/to/your-key.pem prov-app.sh ubuntu@EC2_PUBLIC_IP:/home/ubuntu/
   scp -i "C:\Users\debbi\.ssh\tech511-debbie-aws.pem" prov-app.sh ubuntu@ec2-18-202-167-222:/home/ubuntu/
   ```
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
