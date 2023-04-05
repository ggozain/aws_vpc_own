output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
  sensitive   = false
}