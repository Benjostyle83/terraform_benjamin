# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.environment}-public-route-table"
  }
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

# Private Route Tables
resource "aws_route_table" "private" {
  count  = length(var.private_subnets)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example[count.index % length(aws_nat_gateway.example)].id
  }

  tags = {
    Name = "${var.environment}-private-route-table-${count.index}"
  }
}

# Associate Private Subnets with Private Route Table

resource "aws_route_table_association" "private" {
  for_each = { for index, cidr_block in var.private_subnets : index => cidr_block }

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private[each.key].id
}
