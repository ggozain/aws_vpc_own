variable "public_route_table_id" {
    type = string
}

variable "private_route_table_ids" {
    type = list
}

variable "private_subnet_ids" {
    type = map
}

variable "public_subnet_ids" {
    type = map
}