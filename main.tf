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
  ami = "ami-830c94e3"
  instance_type = "t2.micro"
  security_groups = ["block_all_ingress"]

  tags = {
    Name = "ExampleAppServerInstance"
  }

}

resource "aws_security_group" "block_all_ingress" {
  name        = "block_all_ingress"
  description = "Block all inbound traffic"
#  vpc_id      = "vpc-0f68a67028bc8868c"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "block_all_ingress"
  }
}
