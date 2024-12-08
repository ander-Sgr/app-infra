resource "aws_instance" "ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.security_groups
  subnet_id       = var.subnet_id

  tags = {
    Name = "${var.environment}-ec2-bastion"
  }
}
