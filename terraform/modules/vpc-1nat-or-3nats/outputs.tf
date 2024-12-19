output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets" {
  description = "IDs of the private subnets"
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "public_subnets" {
  description = "IDs of the public subnets"
  value       = [for subnet in aws_subnet.public : subnet.id]
}




output "nat_gateway_ids" {
  value = aws_nat_gateway.example[*].id
}

output "route_table_ids" {
  value = aws_route_table.private[*].id
}
