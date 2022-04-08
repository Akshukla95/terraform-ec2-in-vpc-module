# Resources Block
# Resource-1: Create VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = var.vpc_tag
}

# Resource-2: Create Subnets
resource "aws_subnet" "vpc-dev-public-subnet" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = var.public_subnets_cidr
  #availability_zone       = var.availability_zones
  map_public_ip_on_launch = true
}
resource "aws_subnet" "vpc-dev-private-subnet" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = var.private_subnets_cidr
  #availability_zone       = var.availability_zones
}

# Resource-3: /* Internet gateway for the public subnet */
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}
# Elastic IP for NAT
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.vpc-dev-igw]
}
/* NAT */ 
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.vpc-dev-public-subnet.id
  depends_on    = [aws_internet_gateway.vpc-dev-igw]

  tags = {
    Name        = "nat"
  }
}

# Resource-4: Create Route Table
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-dev-public-route" {
  route_table_id         = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw.id
}

# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet.id
}

resource "aws_route_table" "vpc-dev-private-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

resource "aws_route" "vpc-dev-private-route" {
  route_table_id         = aws_route_table.vpc-dev-private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw.id
}
resource "aws_route_table_association" "vpc-dev-private-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-private-route-table.id
  subnet_id      = aws_subnet.vpc-dev-private-subnet.id
}

# Resource-7: Create Security Group
resource "aws_security_group" "dev-vpc-sg" {
  name        = "dev-vpc-default-sg"
  description = "Dev VPC Default Security Group"
  vpc_id      = aws_vpc.vpc-dev.id

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}