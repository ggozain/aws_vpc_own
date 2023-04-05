# Resource: aws_vpc


resource "aws_vpc" "main" {
    # The CIDR block for the VPC
    cidr_block = "192.168.0.0/16"

    instance_tenancy = "default"

    enable_dns_support = true
    
    enable_dns_hostnames = true

    assign_generated_ipv6_cidr_block = false

    tags = {
      Name = "main"
    }
}

output "vpc_id" {
    value = aws_vpc.main.id
    description = "VPC ID"
    sensitive = false
}