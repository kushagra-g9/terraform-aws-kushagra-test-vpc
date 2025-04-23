# 🚀 Terraform AWS VPC Module

## 🌐 Overview

This is a reusable Terraform module to provision a **custom VPC setup** on AWS. It supports creating both **public and private subnets**, automatically adds an **Internet Gateway** if public subnets are present, and handles **routing configurations** dynamically.

It simplifies infrastructure as code by abstracting VPC setup behind easy-to-configure input variables.

---

## 📦 Features

- ✅ Creates a VPC with user-defined CIDR and name
- 🌐 Supports dynamic creation of public and private subnets
- 🔌 Adds an Internet Gateway if any public subnet exists
- 🛣 Creates route tables and associations for public subnets
- 🔁 Built using `for_each` for scalability and clarity
- 🔍 Automatically separates subnets using local blocks
- ⚡ Simple, minimal inputs with smart defaults

---

## ⚙️ Usage

## ✅ Example Configuration

This is a **working example** of how to use this module in your Terraform project:

```

provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-vpc"
  }

  subnet_config = {
    public_subnet-1 = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-north-1a"
      public     = true
    }

    public_subnet-2 = {
      cidr_block = "10.0.2.0/24"
      az         = "eu-north-1a"
      public     = true
    }

    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "eu-north-1b"
    }
  }
}
```