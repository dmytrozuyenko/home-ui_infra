variable "access_key"{}
variable "secret_key" {}


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
 vpc_security_group_ids = [aws_security_group.home-ui_sg.id]
 user_data       = file("home-ui.sh")
 tags = {
   Name = "home-ui"
 }
}

resource "aws_security_group" "home-ui_sg" {
 name        = "home-ui_sg"
 description = "Traffic rules for Home-UI"

 ingress {
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
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