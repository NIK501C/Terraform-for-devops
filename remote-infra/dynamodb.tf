resource "aws_dynamodb_table" "remote_dynamodb_table" {
  name           = "remote-db"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name        = "remote-dynamodb-table"
  }
}