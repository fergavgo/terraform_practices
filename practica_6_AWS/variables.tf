
variable "virginia_cidr" {
  description = "CIDR de Virginia"
  type        = string
  sensitive   = false
}


# variable "public_subnet_cidr" {
#   description = "CIDR de la red publica"
#   type        = string
# }

# variable "private_subnet_cidr" {
#   description = "CIDR de la red privada"
#   type        = string
# }

variable "Subredes" {
  description = "Listas de subredes"
  type        = list(string)
}

variable "tags" {
  description = "Tags Proyecto"
  type        = map(string)
}