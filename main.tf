# Create the key
# Define type of key
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}   

# Define file to store the key and permissions
resource "local_file" "private_key" {
  content = tls_private_key.this.private_key_pem
    filename = "myKey.pem"
    file_permission = "0600"
}

# Set the key and output the key to key.pem 
resource "aws_key_pair" "this" {
  key_name   = "key"
  public_key = tls_private_key.this.public_key_openssh
}

# Create vpc
resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "this"
  }
}

# Create IG
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "this"
  }
}

# Create RT, IPv4 only
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "this"
  }
}

# Create a Subnet
resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "this"
  }
}

# Associate subnet with Route Table, IPv4 only
resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
  
}

# Create Security Group to allow HTTP,HTTPS,SSH, IPv4 only
resource "aws_security_group" "allow_traffic" {
  name        = "allow_http"
  vpc_id      = aws_vpc.this.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_22_80_443"
  }
}

# Create a NI using set subnet
resource "aws_network_interface" "this" {
  subnet_id       = aws_subnet.this.id
  private_ips     = ["10.0.1.44"]
  security_groups = [aws_security_group.allow_traffic.id]
}

# Assign an EIP to the set NI
resource "aws_eip" "this" {
  vpc                       = true
  network_interface         = aws_network_interface.this.id
  associate_with_private_ip = "10.0.1.44"
  depends_on = [aws_internet_gateway.this]
  }

# Create buntu server and install/enable apache2
resource "aws_instance" "this" {
    ami = "ami-0c9354388bb36c088"
    instance_type = "t2.micro"
    availability_zone = "eu-central-1a"
    key_name = aws_key_pair.this.key_name

    user_data = "${file("script.sh")}" 

    network_interface {
        device_index = 0
        network_interface_id = aws_network_interface.this.id
    }

    tags = {
      Name = "web-server"
    }
}
