resource "azurerm_resource_group" "appgrp" {
  name     = var.resource_group_name
  location = var.location
  tags = var.tags
}

resource "azurerm_virtual_network" "appnetwork" {
  name                = var.virtual_network_name
  location            = var.location  
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network_address_space]
  depends_on = [
    azurerm_resource_group.appgrp
  ]  
  tags = var.tags
} 


resource "azurerm_subnet" "subnet-dv" {    
    name                 = "subnet-dev-01"
    resource_group_name  = var.resource_group_name
    virtual_network_name = var.virtual_network_name
    address_prefixes     = ["10.0.0.0/24"]
    service_endpoints = ["Microsoft.Storage","Microsoft.KeyVault"]
    depends_on = [
      azurerm_virtual_network.appnetwork
    ]
}

resource "azurerm_network_security_group" "appnsg" {
  name                = "app-nsg"
  location            = var.location 
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "appnsg-link" {  
  subnet_id                 = azurerm_subnet.subnet-dv.id
  network_security_group_id = azurerm_network_security_group.appnsg.id

  depends_on = [
    azurerm_virtual_network.appnetwork,
    azurerm_network_security_group.appnsg
  ]
  
}












