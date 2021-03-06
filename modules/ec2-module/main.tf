resource  "aws_instance" "demo-terraform-ec2" {
    ami = var.demo-terraform-ami-id
    instance_type = var.demo-terraform-ec2-instance-type
    key_name = "abhilinux-key"  
    user_data = file("apache-install.sh")
    vpc_security_group_ids = [var.demo-terraform-security-group]
    #availability_zones      = ap-south-1a
    subnet_id = var.pub_subnet_id
    root_block_device {
    volume_size = 20
    volume_type = "gp2"
    }
    tags = {
    Name = "test-ec2"
    Env = "GIIT-sol"
}
}

 resource "aws_instance" "ec2-instance" {
  ami                    = var.demo-terraform-ami-id
  instance_type          = var.demo-terraform-ec2-instance-type
  key_name               = "abhilinux-key"
  associate_public_ip_address = false
  user_data = file("apache-install.sh")
  vpc_security_group_ids = [ var.demo-terraform-security-group ]
  #availability_zones      = ap-south-1a
  subnet_id = var.pvt_subnet_id
  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }
  tags = {
    Name = "test1-ec2"
    Env = "GIIT-sol1"
}

} 
