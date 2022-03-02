provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "mars" {
  bucket = "f-bucket-31"
}

resource "aws_s3_bucket" "media" {
  bucket = "media-files-355127"

  tags = {
    Name = "media-files-355127"
    Environment = "Dev"
  }
}

resource "aws_instance" "project-mars" {
  ami = "ami-0ca05c6eaa4ac40e0"
  instance_type = "t2.micro"
  security_groups = ["my-sg"]
  key_name = "oregon"
}

resource "aws_db_instance" "mars" {
  identifier           = "sample"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "wordpress"
  username             = "root"
  password             = "redhat123"
  publicly_accessible  = true
  skip_final_snapshot  = true
}
