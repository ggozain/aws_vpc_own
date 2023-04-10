module "vpc" {
  source = "../vpc"
  infra_env = "test"
}

resource "aws_nat_gateway" "nat_gw" {

    count = length(module.vpc.vpc_eip_ids)

    allocation_id = module.vpc.vpc_eip_ids[count.index]
    subnet_id     = keys(module.vpc.vpc_public_subnets[count.index])

  tags = {
    Name = "gozain-lab-${var.infra_env}-private-natgw"
    Project     = var.tag_project_name
    Environment = var.infra_env
  }
}