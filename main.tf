##Create EKS compatible VPC and public and private subnet. 
//Required variables: 
// infra_env (string) = environment (i.e. prod)
// vpc_cidr (string) = VPC CIDR block (i.e. 10.0.0.0/17)

module "vpc" {
  source = "./modules/vpc"
  infra_env = "test"
  vpc_cidr  = "10.0.0.0/17"
}

##Creates NATGW public & private. 
//Required variables: 
// infra_env (string) = environment (i.e. prod, tes, dev, qa)
//optional variables:

module "nat_gw"{
  source = "./modules/nat_gw"
  infra_env = "test"
}