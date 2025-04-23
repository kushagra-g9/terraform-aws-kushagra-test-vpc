output "vpc" {
  value = module.vpc.vpc-id

}
output "public_subnet" {
  value = module.vpc.public_subnets

}
output "private_subnets" {
  value = module.vpc.private_subnets

}
