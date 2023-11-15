virginia_cidr = "10.20.0.0/23"
# public_subnet_cidr  = "10.20.1.0/24"
# private_subnet_cidr = "10.20.0.0/24"

Subredes = ["10.20.1.0/24", "10.20.0.0/24"]

tags = {
  "env"         = "Development"
  "owner"       = "Sysadmin Guy"
  "IAC"         = "Terraform"
  "IAC_Version" = "v1.5.5"
  "cloud"       = "AWS"
  "Project"     = "Redes Unificadas"
}

SG_Ingress_CIDR = "152.202.62.163/32"