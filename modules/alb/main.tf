resource "aws_lb" "load_balancer" {
  name               = "${var.environment}-load-balancer"
  load_balancer_type = var.load_balancer_type
  internal           = false
  security_groups    = var.security_groups
  subnets            = var.subnets

  tags = {
    Name = "${var.environment}-app-load-balancer"
  }
}

# target group

resource "aws_alb_target_group" "default-target-group" {
  name     = "${var.ec2_instance_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = var.health_check_path
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher = "200"
  }
}

# autoecaling atach
resource "aws_autoscaling_attachment" "asg_attchment_bar" {

}