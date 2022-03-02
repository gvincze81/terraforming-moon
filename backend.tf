terraform {
  backend "s3" {
    encrypt = true
    bucket = "vg-bucket"
    dynamodb_table = "vg-table"
    key = "terraform.tfstate"
    region = "us-west-2"
  }
}