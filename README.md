# Deploy web server running on Ubuntu in AWS via Terraform

Purpose of the repo is to demonstrate, how to deploy web server running on AWS infrastructre
using Terraform script.

**Prequisities**

1 Install [Terraform](https://www.terraform.io/downloads)

2 Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

3 Configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

~~create key pair via [AWS interface](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html)~~ Included in script.


**Process**

1 Generate [AWS keys](https://registry.terraform.io/providers/hashicorp%20%20/aws/latest/docs/data-sources/key_pair), [extra help](https://stackoverflow.com/questions/49743220/how-do-i-create-an-ssh-key-in-terraform)

2 Create [VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)

3 Create an [Internet Gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)

4 Create a [Custom Route Table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)

5 Create a [Subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)

6 Associate Subnet with a [Route Table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)

7 Create [Security Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) for communication via SSH, HTTP, HTTPS

8 Create a [Network Interface](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) with an IP in set subnet 

9 Assign an [elastic IP](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) to the set network interface 

10 Create Ubuntu server and install and enable web server using [bash script file](https://registry.terraform.io/providers/serverscom/serverscom/latest/docs/guides/user-data)

