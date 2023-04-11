resource "aws_route_table" "public" {

    vpc_id = var.aws_vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }
    tags = {
        Name = "gozain-lab-${var.infra_env}-public-routing-table"
        Project     = var.tag_project_name
        Environment = var.infra_env
    }
  
}

resource "aws_route_table" "private" {
    count = length(var.nat_gw_ids)

    vpc_id = var.aws_vpc_id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.nat_gw_ids[count.index]
    }
    tags = {
        Name = "gozain-lab-${var.infra_env}-private-routing-table-${var.nat_gw_ids[count.index]}"
        Project     = var.tag_project_name
        Environment = var.infra_env
    }
  
}