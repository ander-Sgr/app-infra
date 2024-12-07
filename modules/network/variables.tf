variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string

}

variable "vpc_name" {
  description = "The name of the vpc depends of the env"
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

variable "environment" {
  description = "The environment"
  type        = string
}
