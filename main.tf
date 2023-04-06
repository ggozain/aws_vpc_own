module "vpc" {
  source = "./modules/vpc"

  infra_env = "prod"
  vpc_cidr  = "10.0.0.0/17"
}

#Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "main"
  }
}

#Create Elastic IPs
resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.main]

}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.main]

}

# ####create Public NAT Gateways
# resource "aws_nat_gateway" "natgw_1" {
#   allocation_id = aws_eip.nat1.id
#   subnet_id     = module.vpc

#   tags = {
#     Name = "NAT 1"
#   }
# }

# resource "aws_nat_gateway" "natgw_2" {
#   allocation_id = aws_eip.nat2.id
#   subnet_id     = aws_subnet.public_2.id

#   tags = {
#     Name = "NAT 2"
#   }
# }