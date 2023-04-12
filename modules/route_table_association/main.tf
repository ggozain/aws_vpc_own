resource "aws_route_table_association" "public" {
    for_each = {for subnet, v in var.public_subnet: subnet => v}

    subnet_id = each.key

    route_table_id = var.public_route_table_id
  
}

resource "aws_route_table_association" "private" {
    for_each = {for subnet, v in var.private_subnet: subnet => v}

    subnet_id = each.key

    route_table_id = var.private_route_table_ids[each.value]
  
}