resource "aws_nat_gateway" "example" {
  count = var.environment == "prod" ? 3 : 1

  allocation_id = aws_eip.example[count.index].id
  subnet_id     = aws_subnet.public[count.index % length(aws_subnet.public)].id

  tags = {
    Name = "${var.environment}-nat-${count.index + 1}"
  }
}

resource "aws_eip" "example" {
  count = var.environment == "prod" ? 3 : 1
  vpc   = true
}
