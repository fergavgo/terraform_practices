terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.69.0"
    }
  }
}

provider "azurerm" {
    skip_provider_registration = true
  features {}
}


resource "azurerm_resource_group" "Proyecto_X" {
  name     = "Recursos_Proyecto_X"
  location = "Central US"
}

resource "azurerm_storage_account" "cuentaalmacenamientofergavzure4col" {
  name                     = "cuentaalmacenamiento"
  resource_group_name      = azurerm_resource_group.Proyecto_X.name #Grupo de recursos del resource anterior
  location                 = azurerm_resource_group.Proyecto_X.location #Ubicacion, del resource anterior
  account_tier             = "Standard" #Performance
  account_replication_type = "LRS" # Solo redundancia local en el servidor
}

resource "azurerm_storage_container" "Contenedor" {
  name                  = "contenedordecontenido"
  storage_account_name  = azurerm_storage_account.cuentaalmacenamientofergavzure4col.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "Blob" {
  name                   = "archivozip"
  storage_account_name   = azurerm_storage_account.cuentaalmacenamientofergavzure4col.name
  storage_container_name = azurerm_storage_container.Contenedor.name
  type                   = "Block"
  source                 = "Nombre_Archivo.zip"
}