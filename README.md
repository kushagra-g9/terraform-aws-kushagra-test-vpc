# Terraform AWS VPC Module

## 🌐 Overview
This Terraform module provisions a fully configurable **AWS VPC architecture**. It allows you to define both **public and private subnets**, auto-generates an **Internet Gateway** if needed, and sets up **route tables and subnet associations** dynamically. Ideal for reusable and scalable infrastructure in AWS.

The module is designed to be **easy to use**, **flexible**, and **production-ready**, making it suitable for projects that require a robust cloud network foundation.

---

## 📦 Features

- ✅ Creates a custom VPC with a user-defined CIDR block and name  
- 🌐 Supports dynamic creation of multiple public and private subnets  
- 🔌 Automatically attaches an Internet Gateway if public subnets exist  
- 🛣 Sets up public route tables and associates them with public subnets  
- 🧠 Cleanly separates public and private subnets using `locals`  
- 🔁 Built using reusable `for_each` logic for extensibility  
- 🔍 Includes input validation for subnet CIDR blocks  

---

## ⚙️ Usage

```hcl
module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your-vpc-name"
  }

  subnet_config = {
    public_subnet = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-north-1a"
      # Set this to true to make the subnet public (default is private)
      public     = true
    }

    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "eu-north-1b"
    }
  }
}
```