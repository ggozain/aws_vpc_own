variable "infra_env"{
    type = string
    description = "infrastructure environment"
}

variable "vpc_cidr" {
    type = string
    description = "The IP range to use for the VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_numbers" {
    type = map(number)

    description = "Map of AZ to a number that should be used for public subnets"

    default = {
        "us-east-2a" = 1
        "us-east-2b" = 2
        "us-east-2c" = 3
    }
  
}

variable "private_subnet_numbers" {
    type = map(number)

    description = "Map of AZ to a number that should be used for private subnets"

    default = {
        "us-east-2a" = 4
        "us-east-2b" = 5
        "us-east-2c" = 6
    }
  
}

# variable "public_subnet_ids" {
#     type = list(string)
#     description = "Map of public subnet IDs to its CIRD block"
#     default = tolist(data.aws_subnet.public.*.id)
# }

# variable "private_subnet_ids" {
#     type = list(string)
#     description = "Map of public subnet IDs to its CIRD block"
#     default = tolist(data.aws_subnet.private.*.id)
# }

# variable "elastic_ip_ids" {
#     type = list(string)
#     description = "Map of public subnet IDs to its CIRD block"
#     # default = tolist(data.aws_eip._elastic_ip.*.id)
# }

## VARIABLES FOR TAGS

variable "tag_project_name"{
    type = string
    description = "Project Name"
    default = "EKS Cluster"
}