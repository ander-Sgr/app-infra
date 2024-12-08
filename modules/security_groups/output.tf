output "load_balancer_security_group_id" {
  description = "ID del Security Group del ALB"
  value       = aws_security_group.load_balancer.id
}

output "ec2_security_group_id" {
  description = "ID del Security Group de las instancias EC2"
  value       = aws_security_group.ec2.id
}
