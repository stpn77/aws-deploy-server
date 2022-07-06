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

6 Create [Security Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) for communication via SSH, HTTP, HTTPS

7 Create a [Network Interface](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) with an IP in set subnet 

8 Assign an [elastic IP](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) to the set network interface 

9 Create Ubuntu server and install and enable web server

