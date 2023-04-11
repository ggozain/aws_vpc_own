resource "aws_route_table_association" "public" {
    count = length(var.public_subnet)

    subnet_id = var.public_subnet[count.index]

    route_table_id = var.public_route_table_id
  
}

resource "aws_route_table_association" "private" {
    count = length(var.private_subnet)

    subnet_id = var.private_subnet[count.index]

    route_table_id = var.private_route_table_ids[count.index]
  
}