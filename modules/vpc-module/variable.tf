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
  description = "The az that the resources will be launched"
} */
variable "vpc_tag" {
  type        = map(string)
  description = "tag for vpc name"
}