resource "aws_nat_gateway" "nat_gw" {

    count = length(var.vpc_eip_ids)
    allocation_id = var.vpc_eip_ids[count.index]
    subnet_id     = var.vpc_public_subnet_ids[count.index]

  tags = {
    Name = "gozain-lab-${var.infra_env}-private-natgw"
    Project     = var.tag_project_name
    Environment = var.infra_env
  }
}