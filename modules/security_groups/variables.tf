variable "vpc_id" {
  description = "ID of the VPC where the Security Groups will be created"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., 'development', 'production')"
  type        = string
}

variable "lb_ingress_cidr" {
  description = "CIDR for incoming traffic to the ALB"
  type        = list(string)
}

variable "lb_egress_cidr" {
  description = "CIDR for outgoing traffic from the ALB"
  type        = list(string)
}

variable "ssh_cidr" {
  description = "CIDR for SSH access to EC2 instances"
  type        = list(string)
}

variable "ec2_egress_cidr" {
  description = "CIDR for outgoing traffic from EC2 instances"
  type        = list(string)
}

variable "db_egress_cidr" {
  description = "CIDR for outgoing traffic from the DB"
  type        = list(string)
}
