output "vpc_nat_gw_ids" {
    # Result is a list of the created NAT
    value = tolist(aws_nat_gateway.nat_gw.*.id)
}