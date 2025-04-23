variable "vpc_config" {
  description = "Please provide the VPC configuration including the CIDR block (e.g., 10.0.0.0/16) and a name for the VPC."
  type = object({
    cidr_block = string
    name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR format - ${var.vpc_config.cidr_block}"
  }
}

variable "subnet_config" {
  #sub1{cidr=.. az= } sub2{cidr=  az= }
  description = "Provide the CIDR and AZ for the subnet"
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))
  validation {
    condition     = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR format"
  }
}


