output "vpc_id" {
  value = [ "${aws_vpc.vpc-dev.id}" ]
}

output "public_subnets_id" {
  value = aws_subnet.vpc-dev-public-subnet.id
}

output "private_subnets_id" {
  value = aws_subnet.vpc-dev-private-subnet.id
}


output "security_group_id" {
  value = aws_security_group.dev-vpc-sg.id
}

output "public_route_table" {
  value = aws_route_table.vpc-dev-public-route-table.id
}