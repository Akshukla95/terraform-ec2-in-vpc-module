variable "aws-region" {
  description = "EC2 instance region"
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  description = "The CIDR block for the private subnet"
}

/* variable "availability_zones" {
  type        = list
  description = "The az that the resources will be launched"
} */

variable "vpc_tag" {
  type        = map(string)
  description = "tag for vpc name"
}

variable "demo-terraform-ec2-instance-type" {
    description = "EC2 Instance Type" 
}

/* variable "demo-terraform-ec2-tags" {
  description = "public subnet EC2 instance tags"
  type = map(string)
} */

/* variable "demo-terraform-security-group" {
    description = "Secutity group ids"
    type = string
} */

variable "demo-terraform-ami-id" {
  description = "EC2 instance ami id"
}
/* variable "tags" {
  type = map(string)
  description = "private subnet EC2 instance tags"
} */
/* variable "pub_subnet_id" {
  description = "public subnet id for EC2 instance"
  type = string
} */
/* variable "pvt_subnet_id" {
  description = "private subnet id for EC2 instance"
} */