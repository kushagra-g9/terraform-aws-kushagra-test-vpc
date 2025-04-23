output "vpc" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc-id

}
output "public_subnet" {
  description = "List of public subnet IDs"

  value = module.vpc.public_subnets

}
output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets

}
