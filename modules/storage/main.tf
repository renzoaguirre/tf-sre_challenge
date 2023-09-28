resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = var.tags
  network_rules {
        default_action = "Deny"
        #bypass = "AzureServices" # "None"
        ip_rules = var.public_ip
        virtual_network_subnet_ids = var.vnet_subnetid
    }
}

resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "container" 
}

resource "azurerm_storage_blob" "blob" {
  name                   = "sta-blob-dv-01"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = "./source/blob-file.txt"
}