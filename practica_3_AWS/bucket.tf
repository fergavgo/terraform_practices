resource "aws_s3_bucket" "Primer_Bucket" {
  count = 6
  bucket = "primerbucket-fergavgo86v1-${random_string.sufijo[count.index].id}" #El nombre no puede tener _ y debe ser unico en Amazon
  tags = {
    Name = "terraform_practices"
    Environment = "Develop"
  }
}

resource "random_string" "sufijo" {
  count = 6
  length = 8
  special = false
  upper = false
  numeric = false
}


# Este codigo es para crear UN UNICO bucket en AWS. El código de arriba es para
# crear 6 buckets con nombres aleatorios usando el provider random
# 
# resource "aws_s3_bucket" "Primer_Bucket" {
#   bucket = "primerbucket-fergavgo86v1" #El nombre no puede tener _ y debe ser unico en Amazon
#   tags = {
#     Name        = "terraform_practices"
#   }
# }