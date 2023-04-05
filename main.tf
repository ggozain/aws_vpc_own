#Create new EKS compatible VPC
resource "aws_vpc" "var.vpc_name" {

  cidr_block = "192.168.0.0/16"

  instance_tenancy = "default"

  enable_dns_support = true

  enable_dns_hostnames = true

  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = var.vpc_name
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "var.internet_gateway_name" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.internet_gateway_name
  }
}