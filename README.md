# Deploy web server running on Ubuntu in AWS via Terraform

Purpose of the repo is to demonstrate, how to deploy web server running on AWS infrastructre
using Terraform script.

**Prequisities**
1) create key pair via [AWS interface](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html) 

**Process**

1 Create [VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)

2 Create an [Internet Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)

3 Create a [Custom Route Table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)

4 Create a [Subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)

5 Associate Subnet with a [Route Table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)

6 Create Security Group for communication on ports 22,80,44

7 Create a Network Interface with an IP in set subnet 

8 Assign an elastic IP to the set network interface 

9 Create Ubuntu server and install and enable web server

