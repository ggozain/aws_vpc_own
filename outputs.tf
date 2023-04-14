output "vpc_id" {
    description = "The ID of the VPC created by the VPC module"
    value = module.vpc.vpc_id
}

output "public_subnet_id" {
    description = "The ID of the public subnets created by the VPC module"
    value = values(module.vpc.vpc_public_subnets)
}

output "private_subnet_id" {
    description = "The ID of the public subnets created by the VPC module"
    value = values(module.vpc.vpc_private_subnets)
}