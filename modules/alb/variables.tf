variable "environment" {
  description = "Deployment environment (e.g., 'development', 'production')"
  type        = string
}

variable "load_balancer_type" {
  description = "Type of load balancer to create"
  type        = string
}

variable "security_groups" {
  description = "List of Security Groups for the ALB"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
