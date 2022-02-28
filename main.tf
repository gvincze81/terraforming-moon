terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.0"
}

provider "aws" {
  profile = "default"
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami = "ami-0341aeea105412b57"
  instance_type = "t2.micro"
  security_groups = ["my-sg"]
  key_name = aws_key_pair.my-key.key_name

  tags = {
    Name = "ExampleAppServerInstance"
  }

}

#resource "aws_security_group" "my-sg" {
  #name        = "my-sg"
  #description = "Block all inbound traffic"

  #ingress {
    #from_port = 22
    #protocol  = "TCP"
    #to_port   = 22
    #cidr_blocks = ["176.63.1.54/32", "37.76.60.251/32"]
  #}

  #egress {
    #from_port        = 0
    #to_port          = 0
    #protocol         = "-1"
    #cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  #}

  #tags = {
    #Name = "my-sg"
  #}
#}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = tls_private_key.example.public_key_openssh

  #provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    #command = "echo '${tls_private_key.example.private_key_pem}' > ~/.ssh/my-key.pem"
  #}
}
