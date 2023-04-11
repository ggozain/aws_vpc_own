resource "aws_route_table_association" "public" {
    for_each = var.public_subnet

    subnet_id = each.key

    route_table_id = var.public_route_table_id
  
}

resource "aws_route_table_association" "private" {
    for_each = var.private_subnet

    subnet_id = each.key

    route_table_id = var.private_route_table_ids[index(var.private_subnet, each.value)]
  
}