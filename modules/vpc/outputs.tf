output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "vpc_cidr" {
    value = aws_vpc.vpc.cidr_block
}

output "vpc_public_subnets" {
  # Result is a map of subnet id to cidr block, e.g.
  # { "subnet_1234" => "10.0.1.0/4", ...}
  value = {
    for idx, subnet in aws_subnet.public.*.id :
    idx => subnet
  }
}

output "vpc_private_subnets" {
  # Result is a map of subnet id to cidr block, e.g.
  # { "subnet_1234" => "10.0.1.0/4", ...}
  value = {
    for idx, subnet in aws_subnet.private.*.id :
    idx => subnet
  }
}

output "vpc_eip_ids" {
    # Result is a list of elastic IP ids 
    value = aws_eip.elastic_ip[*].id
}

output "vpc_internet_gateway_id" {
  value = aws_internet_gateway.main.id
}