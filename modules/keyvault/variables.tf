variable "keyvault_name" {
    type=string 
    description = "This defines the KeyVault name"
}

variable location {
    type=string
    description = "This defines the location"
}

variable "resource_group_name" {
    type=string 
    description = "This defines the resource group name"
}

variable "vnet_subnetid" {
    type=list(string)
    description = "This defines the VNet ID"
}

variable "public_ip" {
    type=list(string)
    description = "This defines the Public IP"
}

variable "tags" {
  type = map(string)
  description = "This defines the tags"
}