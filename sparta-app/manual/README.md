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
3. ```
