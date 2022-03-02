terraform {
  backend "s3" {
    encrypt = true
    bucket = "f-bucket-31"
    dynamodb_table = "vg-table"
    key = "terraform.tfstate"
    region = "us-west-2"
  }
}