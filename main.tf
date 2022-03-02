terraform {
  backend "s3" {
    bucket = "vg-bucket"
    key = "state"
    region = "us-west-2"
  }
}
