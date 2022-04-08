module "vpc-module" {
  source = "./modules/vpc-module"
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  vpc_tag = var.vpc_tag
}

module "ec2-module" {
  source = "./modules/ec2-module"
  demo-terraform-ec2-instance-type = var.demo-terraform-ec2-instance-type

  demo-terraform-security-group = module.vpc-module.security_group_id
  
  demo-terraform-ami-id = var.demo-terraform-ami-id
  #demo-terraform-ec2-tags = var.demo-terraform-ec2-tags
  pub_subnet_id     = module.vpc-module.public_subnets_id
}