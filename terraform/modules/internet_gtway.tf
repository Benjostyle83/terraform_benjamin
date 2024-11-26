# Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id  # Associate with the main VPC

  tags = {
    Name = format("internet-gateway-%s", var.tags["environment"])
  }
}

