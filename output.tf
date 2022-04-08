output "vpc_id" {
    value = module.vpc-module.vpc_id  
}

output "public_subnets_id" {
  value = module.vpc-module.public_subnets_id
}

output "private_subnets_id" {
  value = module.vpc-module.private_subnets_id
}

output "security_group_id" {
  value = module.vpc-module.security_group_id
}

output "public_route_table" {
  value = module.vpc-module.public_route_table
}

output "demo-terraform-pub-ec2-public-ip" {
  description = "EC2 Instance Public IP"
  value = module.ec2-module.demo-terraform-pub-ec2-public-ip
}

# Attribute Reference - Create Public DNS URL 
output "demo-terraform-pub-ec2-public-dns" {
  description = "Public DNS URL of an EC2 Instance"
  value = module.ec2-module.demo-terraform-pub-ec2-public-dns
}

output "pub_ec2_instance_private_ip" {
  description = "Private IP Addresses for EC2 Instances"
  value       = module.ec2-module.pub_ec2_instance_private_ip
}

output "pvt_ec2_instance_private_ip" {
  description = "Private IP Addresses for EC2 Instances in private subnet"
  value       = module.ec2-module.pvt_ec2_instance_private_ip
}