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

# Module Block
module "s3-backend" {
  source     = "../../../modules/s3-backend"  # Path to your module
  aws_region = "us-east-1"                   # Region input for the module

  # Common tags argument
  common_tags = {
    Environment = "dev"
    Project     = "my-project"
    Owner       = "my-team"
  }

  # Environment argument
  environment = "dev"  # Pass the environment (can be "dev", "prod", etc.)

  # Project argument
  project = "benjamin-s3-backend"  # Pass the project name (replace with your actual project name)
}

