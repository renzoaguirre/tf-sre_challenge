variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name in Azure"
}

variable "storage_container_name" {
  type        = string
  description = "Storage Container name in Azure"
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