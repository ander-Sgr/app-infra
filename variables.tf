# vars for the module to create the VPC and subnets
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string

}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnet"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for the subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# vars for the module to create the security groups
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
##############################################################
# vars for the module to create the ALB
variable "load_balancer_type" {
  description = "Type of load balancer to create"
  type        = string
}

##########################################################
# vars for the module to create the ASG
variable "asg_min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the ASG"
  type        = number
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
