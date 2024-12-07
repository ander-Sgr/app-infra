output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets" {
  description = "Lists ids public subnets"
  value       = aws_subnet.public-subnet[*].id
}

output "private_subnets" {
  description = "Lists ids privates subnets"
  value       = aws_subnet.private_subnet[*].id
}

output "nat_gateway_id" {
  description = "Id of the NAT Gateway"
  value       = aws_nat_gateway.nat_private_gateway.id
}
