# Securing the database in a 2-tier app deployment

- [Securing the database in a 2-tier app deployment](#securing-the-database-in-a-2-tier-app-deployment)
  - [Intro to Virtual Networking](#intro-to-virtual-networking)
    - [What is a virtual network](#what-is-a-virtual-network)
    - [Terminology used with virtual networks](#terminology-used-with-virtual-networks)
    - [Understanding Ipv4 addresses and CIDR blocks](#understanding-ipv4-addresses-and-cidr-blocks)
    - [Understand defaults for the AWS](#understand-defaults-for-the-aws)
  - [Intro to AWS VPCs](#intro-to-aws-vpcs)
  - [Plan our custom VPC](#plan-our-custom-vpc)
  - [Create our VPC](#create-our-vpc)
    - [](#)
    - [](#-1)

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

## Intro to AWS VPCs

## Plan our custom VPC

## Create our VPC

###

###