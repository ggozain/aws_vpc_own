resource "aws_route_table_association" "public" {
    for_each = var.public_subnet_ids

    subnet_id = each.value

    route_table_id = var.public_route_table_id
  
}

resource "aws_route_table_association" "private" {
    count = length(var.private_subnet_ids)

    subnet_id = var.private_subnet_ids[count.index]

    route_table_id = var.private_route_table_ids[count.index]
  
}