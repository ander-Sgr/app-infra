module "vpc" {
  source               = "./modules/network"
  cidr_block           = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = terraform.workspace
}


module "security_groups" {
  source          = "./modules/security_groups"
  vpc_id          = module.vpc.vpc_id
  environment     = terraform.workspace
  lb_ingress_cidr = var.lb_ingress_cidr
  lb_egress_cidr  = var.lb_egress_cidr
  ssh_cidr        = var.ssh_cidr
  ec2_egress_cidr = var.ec2_egress_cidr
  db_egress_cidr  = var.db_egress_cidr
}

module "alb" {
  source             = "./modules/alb"
  environment        = terraform.workspace
  security_groups    = [module.security_groups.load_balancer_security_group_id]
  subnets            = module.vpc.public_subnets
  load_balancer_type = var.load_balancer_type
  vpc_id             = module.vpc.vpc_id
}

module "autoscaling_group" {
  source                = "./modules/asg"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_pair_name         = var.key_name
  security_groups       = [module.security_groups.ec2_security_group_id]
  environment           = terraform.workspace
  asg_min_size          = var.asg_min_size
  asg_max_size          = var.asg_max_size
  asg_desired_capacity  = var.asg_desired_capacity
  key_name              = var.key_name
  alb_target_group_arns = [module.alb.lb_target_group_arn]
  private_subnets       = module.vpc.private_subnets
  lb_target_group_arn   = [module.alb.lb_target_group_arn]
}

module "bastion" {
  source          = "./modules/ec2"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [module.security_groups.ec2_security_group_id]
  environment     = terraform.workspace
  subnet_id       = module.vpc.public_subnets[0]
}
