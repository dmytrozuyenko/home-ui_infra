variable "access_key"{}
variable "secret_key"{}


provider "aws" {
 region     = "us-east-2"
 access_key = var.access_key
 secret_key = var.secret_key
}


data "aws_ami" "ubuntu" {
 most_recent = true

 filter {
   name   = "name"
   values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
 }

 filter {
   name   = "virtualization-type"
   values = ["hvm"]
 }

 filter {
   name   = "root-device-type"
   values = ["ebs"]
 }

 owners = ["099720109477"]
}

resource "aws_instance" "home-ui" {
 ami             = data.aws_ami.ubuntu.id
 instance_type   = "t2.micro"
 key_name = "home"
 vpc_security_group_ids = [aws_security_group.home-ui_sg.id]
 tags = {
   Name = "home-ui"
 }
}

resource "aws_security_group" "home-ui_sg" {
 name        = "home-ui_sg"
 description = "Traffic rules for Home-UI"

  ingress {
   description      = "HTTP"
   from_port        = 80
   to_port          = 80
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }
 
 ingress {
   description      = "HTTPS"
   from_port        = 443
   to_port          = 443
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }
 
 ingress {
   description      = "Jenkins"
   from_port        = 22
   to_port          = 22
   protocol         = "-1"
   cidr_blocks      = ["34.123.118.107/32"]
   ipv6_cidr_blocks = ["::/0"]
 }

  ingress {
   description      = "Desktop"
   from_port        = 22
   to_port          = 22
   protocol         = "-1"
   cidr_blocks      = ["46.119.254.233/32"]
   ipv6_cidr_blocks = ["::/0"]
 }
 
 egress {
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
 }

 tags = {
   Name = "home-ui"
 }
}
