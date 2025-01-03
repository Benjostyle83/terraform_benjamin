aws_region  = "us-west-1"  # AWS region where resources will be created

project     = "benjamin-s3-backend"
environment = "dev"

common_tags = {
  Project     = "benjamin-s3-backend"
  Environment = "dev"
  Owner       = "benjamim"
}

dynamodb_table_name = "tf-state-lock"




