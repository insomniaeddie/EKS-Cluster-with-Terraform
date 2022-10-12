module "vpc" {
  source              = "terraform-aws-modules/vpc/aws"
  version             = "3.16.0"
  name                = "EKS-VPC"
  cidr                = "10.0.0.0/16"
  azs                 = data.aws_availability_zones.available.names
  private_subnets     = ["10.0.1.0/24", "10.0.4.0/24", "10.0.8.0/24"]
  public_subnets      = ["10.0.12.0/24", "10.0.16.0/24", "10.0.20.0/24"]
  enable_nat_gateway  = true
  single_nat_gateway  = true
  enable_dns_hostnames = true

  tags = {
    "Name" = "EKS-VPC"
  }

  public_subnet_tags = {
    "Name" = "EKS-Public"
  }

  private_subnet_tags = {
    "Name" = "EKS-Private"
  }
}

variable "region" {
  default = "us-east-2"
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "my-eks-cluster"
}

