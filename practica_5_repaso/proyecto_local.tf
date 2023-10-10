resource "local_file" "archivo" {
  content  = "Este es el contenido del archivo"
  for_each = var.set_nombres_archivos
  filename = each.value
}



