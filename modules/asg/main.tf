resource "aws_launch_configuration" "app_instance" {
  name                        = "${var.environment}-app-launch"
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = var.security_groups
  user_data                   = file("${path.module}/user_data.sh")
  associate_public_ip_address = false
}

resource "aws_autoscaling_group" "app_asg" {
  name                      = "${var.environment}-app-asg"
  launch_configuration      = aws_launch_configuration.app_instance.name
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  vpc_zone_identifier       = var.private_subnets
  target_group_arns         = var.alb_target_group_arns
  health_check_type         = "EC2"
  health_check_grace_period = 300
  tag {
    key                 = "Name"
    value               = "${var.environment}-app-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "app_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
  lb_target_group_arn    = var.alb_target_group_arns[0]

}
