##Create EKS compatible VPC and public and private subnet. 
//Required variables: 
// infra_env (string) = environment (i.e. prod)
// vpc_cidr (string) = VPC CIDR block (i.e. 10.0.0.0/17)

module "vpc" {
  source    = "./modules/vpc"
  infra_env = "test"
  vpc_cidr  = "10.0.0.0/17"
}

##Creates NATGW public & private. 
//Required variables: 
// infra_env (string) = environment (i.e. prod, tes, dev, qa)
// vpc_eip_ids = list of elastic-ip-ids in the VPC
// vpc_public_subnets = list of public subnets ids
//optional variables:

module "nat_gw" {
  source                = "./modules/nat_gw"
  vpc_eip_ids           = module.vpc.vpc_eip_ids
  vpc_public_subnet_ids = keys(module.vpc.vpc_public_subnets)
  infra_env             = "test"
}

##Creates public & private routing tables
//Required variables: 
// infra_env (string) = environment (i.e. prod, tes, dev, qa)
// vpc_id = (string) the main VPC ID created by VPC module
// igw_id = (sting) ID of the internet gw created by VPC module
// natgw_ids = (list) list of the natgws IDs created by VPC module
//optional variables:
module "routing_tables" {

  source     = "./modules/routing_tables"
  infra_env  = "test"
  aws_vpc_id = module.vpc.vpc_id
  igw_id     = module.vpc.vpc_internet_gateway_id
  nat_gw_ids = module.nat_gw.vpc_nat_gw_ids
}

data "aws_subnet" "private" {
  vpc_id = module.vpc.vpc_id
}

data "aws_subnet" "public" {
  vpc_id = module.vpc.vpc_id
}

module "route_table_association" {

  source                  = "./modules/route_table_association"
  vpc_id                  = module.vpc.vpc_id
  public_route_table_id   = module.routing_tables.public_route_table_id
  private_route_table_ids = module.routing_tables.private_route_table_ids
  public_subnet           = values(data.aws_subnet.public)[*].id
  private_subnet          = values(data.aws_subnet.private)[*].id
}