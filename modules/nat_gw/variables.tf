variable "infra_env"{
    type = string
    description = "infrastructure environment"
}

variable "tag_project_name"{
    type = string
    description = "Project Name"
    default = "EKS Cluster"
}

variable "vpc_eip_ids"{
    type = list
    description = "List of the elastic IP Ids as the output from vpc module"
}

variable "vpc_public_subnet_ids" {
    type = list
    description = "map of subnet id to cidr block, e.g.{ subnet_1234 => 10.0.1.0/4}"
}