resource "aws_security_group" "load_balancer" {
  name        = "${var.environment}-load-balancer-sec-group"
  description = "Controls access to the ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.lb_ingress_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.lb_egress_cidr
  }
  tags = {
    Name = "${var.environment}-load-balancer-sec-group"
  }
}

resource "aws_security_group" "ec2" {
  name        = "${var.environment}-ec2-sec-group"
  description = "Allows inbound access from the ALB only"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.load_balancer.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ec2_egress_cidr
  }
  tags = {
    Name = "${var.environment}-ec2-sec-group"
  }
}

resource "aws_security_group" "postgres" {
  name        = "${var.environment}-postgres-sec-group"
  description = "Controls access to PostgreSQL DB"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.db_egress_cidr
  }
  tags = {
    Name = "${var.environment}-postgres-sec-group"
  }
}
