# Deploy web server running on Ubuntu in AWS via Terraform

Purpose of the repo is to demonstrate, how to deploy web server running on AWS infrastructre
using Terraform script.

**Prequisities**
1) create key pair via [AWS interface](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html) 

**Process**

1 Create VPC
2 Create an Internet Gateway
3 Create aCustom Route Table
4 Create a Subnet
5 Associate Subnet with a Route Table
6 Create Security Group for communication on ports 22,80,44
7 Create a Network Interface with an IP in set subnet 
8 Assign an elastic IP to the set network interface 
9 Create Ubuntu server and install and enable web server

