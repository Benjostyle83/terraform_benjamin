# Public Subnets
resource "aws_subnet" "public" {
  for_each = { for index, cidr_block in var.public_subnets : index => cidr_block }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = var.availability_zones[each.key % length(var.availability_zones)]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnet-${each.key}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  for_each = { for index, cidr_block in var.private_subnets : index => cidr_block }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = var.availability_zones[each.key % length(var.availability_zones)]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment}-private-subnet-${each.key}"
  }
}




