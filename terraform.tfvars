aws-region      = "ap-south-1"
vpc_cidr             = "10.0.0.0/16"
public_subnets_cidr  = "10.0.1.0/28"
private_subnets_cidr = "10.0.10.0/28" 
demo-terraform-ec2-instance-type = "t2.micro"
demo-terraform-ami-id            = "ami-04893cdb768d0f9ee"
#demo-terraform-security-group    = module.vpc-module.security_group_id
#subnet_id = module.vpc-module.public_subnets_id
vpc_tag    = {
    Name = "test-vpc"
    Env = "GIIT-sol"
}

/* demo-terraform-ec2-tags = {
    Name = "test-ec2"
    Env = "GIIT-sol"
} */


