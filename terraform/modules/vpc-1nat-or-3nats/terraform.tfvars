environment        = "prod" # Change to "dev" or "prod"
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets    = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
aws_region = "us-east-1"
