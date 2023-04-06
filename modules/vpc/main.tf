 #Create new EKS compatible VPC
 resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  
  tags = {
    Name = "gozain-lab-${var.infra_env}-vpc"
    Environment = var.infra_env
  }
}

resource "aws_subnet" "public" {
    for_each = var.public_subnet_numbers

    vpc_id = aws_vpc.vpc.id

    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)

    tags = {
        Name        = "gozain-lab-${var.infra_env}-public-subnet"
        Project     = var.tag_project_name
        Role        = "public"
        Environment = var.infra_env
        Subnet      = "${each.key}-${each.value}"
    }
}

resource "aws_subnet" "private" {
    for_each = var.private_subnet_numbers

    vpc_id = aws_vpc.vpc.id

    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)

    tags = {
        Name        = "gozain-lab-${var.infra_env}-private-subnet"
        Project     = var.tag_project_name
        Role        = "private"
        Environment = var.infra_env
        Subnet      = "${each.key}-${each.value}"
    }
}