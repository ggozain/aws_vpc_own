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
        "kubernetes.io/cluster/eks" = "shared"
        "kubernetes.io/role/elb"    = 1
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
        "kubernetes.io/cluster/eks"       = "shared"
        "kubernetes.io/role/internal-elb" = 1
    }
}

#Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "gozain-lab-${var.infra_env}-igw"
    Project     = var.tag_project_name
    Role        = "public"
    Environment = var.infra_env
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.vpc.id]
  }
    tags = {
    Role = "public"
  }
}

#Create Elastic IPs
resource "aws_eip" "elastic_ip" {
    depends_on = [aws_internet_gateway.main]
    count = length(data.aws_subnets.subnets.ids)

}



# resource "aws_nat_gateway" "natgw" {
#     for_each = var.public_subnet_ids

#     allocation_id = aws_eip.elastic_ip
#     subnet_id     = each.value

#   tags = {
#     Name = "gozain-lab-${var.infra_env}-private-natgw"
#     Project     = var.tag_project_name
#     Environment = var.infra_env
#   }
# }