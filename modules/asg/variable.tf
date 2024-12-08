variable "environment" {
  description = "Name of the environment (dev, prod, etc.)"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "security_groups" {
  description = "List of Security Groups for the instances"
  type        = list(string)
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "alb_target_group_arns" {
  description = "value of the target group arn"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "lb_target_group_arn" {
  description = "ARN of the target group"
  type        = list(string)
}
