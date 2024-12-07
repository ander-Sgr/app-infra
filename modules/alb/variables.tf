variable "environment" {
  description = "Deployment environment (e.g., 'development', 'production')"
  type        = string
}

variable "load_balancer_type" {
  description = "The type of the load balancer by default (application)"
  type        = string
}

variable "security_groups" {
  description = "Security groups for the alb"
  type        = list(string)
}

variable "subnets" {
  description = "subnets for ALB"
  type        = list(string)
}

variable "ec2_instance_name" {
  type = string
}

variable "vpc_id" {
  description = "ID of the VPC where the Security Groups will be created"
  type        = string
}

variable "health_check_path" {
  description = "The destination for the health check request"
  type        = string
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check"
  type        = number
}

variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = number
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering a target unhealthy"
  type        = number
}
