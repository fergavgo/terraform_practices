resource "aws_s3_bucket" "mi-primer-bucket" {
  count = 10
  bucket = "los12-23082023-${random_string.aleatorio[count.index].id}"

  tags = {
    Name        = "DESARROLLO"
    Environment = "Dev"
  }
}

resource "random_string" "aleatorio" {
  count = 10
  length           = 16
  special          = false
  upper = false
  numeric          = true
}