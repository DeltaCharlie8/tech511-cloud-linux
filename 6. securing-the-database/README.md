# Securing the database in a 2-tier app deployment

- [Securing the database in a 2-tier app deployment](#securing-the-database-in-a-2-tier-app-deployment)
  - [Intro to Virtual Networking](#intro-to-virtual-networking)
    - [What is a virtual network](#what-is-a-virtual-network)
    - [Terminology used with virtual networks](#terminology-used-with-virtual-networks)
    - [Understanding Ipv4 addresses and CIDR blocks](#understanding-ipv4-addresses-and-cidr-blocks)
    - [Understand defaults for the AWS](#understand-defaults-for-the-aws)
  - [Planing your custom VPC](#planing-your-custom-vpc)
    - [How They Link Together](#how-they-link-together)
    - [Create our VPC](#create-our-vpc)

## Intro to Virtual Networking

### What is a virtual network
- a way for devices/computers running in the cloud to talk to each other, similar to your wi-fi at home.
- think of it a bit like an apartment
- set up the range of private ip addresses to be used on that network
- the space (range of private ip addresses) we have on the network is split up into one or more subnets (rooms within the apartment). 
- there are different ways to protect the network:
  - manually set up the flow of traffic around the network
  - firewall rules to protect the network, subnets and indiviual devices

### Terminology used with virtual networks
- VPC/VNet is the overall virtual network
  - AWS: VPC (Virtual Private Cloud)
  - Azure: VNet (Virtual Network)
  - GCP: VPC (Virtual Private Cloud)
- subnet
  - section of the network
- firewall/ security group/ NSG
  - rules to allow or deny traffic
- route table
  - tell traffic where to go
- peering
  - connecting different networks together

### Understanding Ipv4 addresses and CIDR blocks
for another day


### Understand defaults for the AWS
- AWS provides default VPCs in every region
- default VPC has a default architecture and uses default rules which are permissive (not as secure as a custom VPC)

## Planing your custom VPC
### How They Link Together
 
1. **App VM**  
   - Placed in the **public subnet** (`IP_ADDRESS`).  
   - Connected to the internet via the Internet Gateway through the public route table.  
   - Protected by a security group (controls HTTP/SSH access).  
 
2. **DB VM**  
   - Placed in the **private subnet** (`IP_ADDRESS`).  
   - No direct internet access (kept isolated).  
   - Only reachable from the App VM through the VPC’s internal routing.  
   - Security group configured to block all direct external traffic.
 
3. **Routing**  
   - Requests go: Internet → Internet Gateway → Public Route Table → Public Subnet → App VM.  
   - The App VM can then communicate with the DB VM internally within the VPC.  
   - The DB VM never receives traffic directly from the internet.  

### Create our VPC
**Step 1 – Create the VPC**
- Choose VPC Only.  
- Name tag: `tech511-debbie-2tier-first-vpc`.  
- IPv4 CIDR: `IP_ADDRESS`
 
**Step 2 – Create Subnets**
- Public Subnet  
  - Name: `tech511-debbie-public-subnet`.  
  - Availability Zone: `eu-west-1a` (Ireland 1a).  
  - IPv4 CIDR block: `IP_ADDRESS`.  
 
- Private Subnet  
  - Name: `tech511-debbie-private-subnet`.  
  - Availability Zone: `eu-west-1b`.  
  - IPv4 subnet CIDR block: `IP_ADDRESS`.  
 
**Step 3 – Create Internet Gateway**
- Name tag: `tech511-debbie-2tier-first-vpc-ig`.  
- Attach to the VPC (shows as “detached” until attached).  
- Actions → *Attach to VPC* → Select the VPC.  
 
**Step 4 – Configure Route Tables**
- Default route table → already exists for private/internal traffic.  
- Create a public route table:  
  - Name: `tech511-debbie-2tier-first-vpc-public-rt`.  
  - Select the VPC.  
  - Click Create.  
 
- Associate the public subnet with this route table:  
  - Subnet Associations → Edit → Select Public Subnet.  
 
- Under routes select edit routes
  - Destination: `0.0.0.0/0` (means all internet traffic).  
  - Target: the Internet Gateway created earlier.  
 
**Step 5 – Check VPC and Resource Map**
- Go to Your VPCs and select the created VPC.  
- Scroll down to view the resource map for an overview of attached components.  
 
![Example Resource Map for VPC](../images/resource-map.png)
 
**Step 6 – Create Database Instance**
- Use an AMI with MongoDB preinstalled.  
- Launch a DB instance as usual but under Network settings:  
  - Set VPC to the custom VPC.  
  - Set Subnet to the private subnet.  
  - Disable Auto-assign public IP.  
- Security group note:  
  - Previous security groups from the default VPC cannot be reused.  
  - Create a new security group for this VPC.  
  - Rule:  
    - Type: Custom TCP  
    - Port range: `27017`  
    - Source type: Anywhere (temporary — later restrict to subnet IPs).  
 
**Step 7 – Create Application Instance**
- Launch from AMI (not from template, as templates are tied to specific VPCs).  
- Under Network settings:  
  - Select the custom VPC.  
  - Select the public subnet.  
  - Enable Auto-assign public IP.  
- Create a new security group:  
  - Allow HTTP and SSH (source type: Anywhere for testing).  
- Update user data:  
  - Change `DB_HOST` to the private IP address of the DB instance.
