resource "aws_dynamodb_table" "mars-table" {
  name = "vg-table"
  hash_key = "Mars"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "Mars"
    type = "S"
  }
}