##Create EKS compatible VPC. Required variables: 
// infra_env (string) = environment (i.e. prod)
// vpc_cidr (string) = VPC CIDR block (i.e. 10.0.0.0/17)

module "vpc" {
  source = "./modules/vpc"
  infra_env = "test"
  vpc_cidr  = "10.0.0.0/17"
}



# #Create Elastic IPs
# resource "aws_eip" "nat1" {
#   depends_on = [aws_internet_gateway.main]

# }

# resource "aws_eip" "nat2" {
#   depends_on = [aws_internet_gateway.main]
# }


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