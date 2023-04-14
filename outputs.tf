output "vpc_id" {
    description = "The ID of the VPC created by the VPC module"
    value = module.vpc.vpc_id
}