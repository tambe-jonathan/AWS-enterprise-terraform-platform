module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  azs      = ["us-east-1a", "us-east-1b"]
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source         = "../../modules/load_balancer"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg_id      = module.security.alb_sg_id
}

module "compute" {
  source           = "../../modules/compute"
  vpc_id           = module.vpc.vpc_id
  private_subnets  = module.vpc.private_subnets
  app_sg_id        = module.security.app_sg_id
  target_group_arn = module.alb.target_group_arn
  ami_id           = "ami-0c101f26f147fa7fd" # Verify AMI for your region!
  instance_type    = "t3.micro"
}
