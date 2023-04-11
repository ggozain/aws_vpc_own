variable "infra_env"{
    type = string
    description = "infrastructure environment"
}

variable "tag_project_name"{
    type = string
    description = "Project Name"
    default = "EKS Cluster"
}

variable "aws_vpc_id" {
    type = string
    description = "VPC ID"
}

variable "igw_id" {
    type = string
    description = "Internet Gateway ID for Public routing table"
}

variable "nat_gw_ids" {
    type = list
    description = "List of available NAT Gateways inside the VPC"
}