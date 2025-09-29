# Intro to AWS

- [Intro to AWS](#intro-to-aws)
  - [What is AWS](#what-is-aws)
  - [Marketshare and use cases for AWS](#marketshare-and-use-cases-for-aws)
  - [How is AWS structured globally](#how-is-aws-structured-globally)
    - [What are AWS regions](#what-are-aws-regions)
    - [What are AWS availability zones](#what-are-aws-availability-zones)
    - [What are AWS points of Presence/ Edge locations](#what-are-aws-points-of-presence-edge-locations)
  - [Monolith v 2-Tier Architecture](#monolith-v-2-tier-architecture)
    - [Monolith](#monolith)
    - [2-Tier](#2-tier)


## What is AWS
Amazon Web Services
- 2002 internally launched
- 2004 pubicly launched
  
## Marketshare and use cases for AWS
Use Cases
- Netflix
- McDonalds
- Facebook
- BBC
- Coursera
  
## How is AWS structured globally
Regions across the world, with 3/4 availability zones in each
- each zone has a big data center or cluster of data centers

benefits for a business
- low latency (the response time for the server to get back to the user)
- reduce costs depending on the region
- data compliance
  
### What are AWS regions
- US-East
- US-West
- Europe(Ireland)
- Europe(London)
  
### What are AWS availability zones
- Ireland has 3 zones
- London has 3 zones
  
### What are AWS points of Presence/ Edge locations
Both help speed up content delivery

## Monolith v 2-Tier Architecture

### Monolith
All the components of the application are combined into one single folder.
- on AWS everything is stored on a single EC2 instance
- you would use linux to control ther server running the app, the app code, and the database all in one place.
- Pros
  - Simple to set up (one server).
  - Easier to deploy for small apps.
  - Lower cost initially.
  
- Cons
  - Hard to scale — if traffic grows, you need to scale the whole instance, even if just one part (like the DB) is overloaded.
  - Updates/deployments can break the entire system.
  - Less fault-tolerant (if server crashes, everything goes down).

### 2-Tier
The application is split into 2 tiers:
  - the application
  - the database

You can have more than one EC2 instance for the application, having a separate database instance makes it more secure as the app speaks to the database over a virtual private network (VPC)

- Pros
  - More scalable — you can scale app servers separately from the DB.
  - Better security — DB can be isolated in private subnet, not exposed to the internet.
  - Easier to maintain — can update app servers without touching DB.

- Cons
  - Slightly more complex setup.
  - Requires networking configuration (VPC, security groups, subnets).
  - Costs more than a single box.