# Configure the AWS provider
provider "aws" {
  region = var.aws_region  # Uses the region from the variables file
}

 ## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

