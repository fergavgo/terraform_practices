variable "nombre_archivo" { 
}

variable "nombre_directorio" {
}

variable "set_nombres_archivos" {
    default = ["Nombre1", "Nombre2", "Nombre3", "Nombre4"]
    type = set(string)
}