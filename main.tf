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