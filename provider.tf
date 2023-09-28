terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.32.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "stadv01"
    container_name = "sta-container-dv-01"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}    
}