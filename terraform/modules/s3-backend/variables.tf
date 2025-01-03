variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-west-2"  # Replace with your desired region
}

variable "project" {
  description = "The project name"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

variable "common_tags" {
  description = "A map of common tags to apply to resources"
  type        = map(string)
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "tf-state-lock"
}



