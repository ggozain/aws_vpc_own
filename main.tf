module "vpc" {
  source = "./modules/vpc"

  infra_env = var.infra_env
  vpc_cidr = "10.0.0.0/17"
}
  

#Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
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

####create Public NAT Gateways
resource "aws_nat_gateway" "natgw_1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "natgw_2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public_2.id

  tags = {
    Name = "NAT 2"
  }
}