provider "aws" {
  region = "us-east-1"
}

# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# VPC Module
module "vpc" {
  source               = "../../../modules/vpc-1nat-or-3nats"
  aws_region           = "us-east-1"
  vpc_cidr             = "10.0.0.0/16"
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]

  # Optional: Add environment variable to distinguish between dev and prod
  environment          = "prod" # or "dev"
}
