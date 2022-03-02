provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "mars" {
  bucket = "vg-bucket"
}

resource "aws_instance" "project-mars" {
  ami = "ami-0ca05c6eaa4ac40e0"
  instance_type = "t2.micro"
  security_groups = ["my-sg"]
  key_name = "oregon"
}