variable "ami_id" {
  description = "AMI for use"
  type        = string
}

variable "instance_type" {
  description = "The type of the instace can be t2.micro t2.large"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair"
  type        = string 
}

variable "public_key_path" {
  description = "Path to the public key"
  type        = string
  default = "~/.ssh/id_rsa.pub"
}

variable "security_groups" {
  description = "List of security groups"
  type        = list(string)
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  
}