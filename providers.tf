terraform {

  required_version = ">=1.1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.4"
    }
  }

  backend "azurerm" {
    resource_group_name  = "lineten-rg"
    storage_account_name = "linetendemostorage"
    container_name       = "tfstate"
    key                  = "lineten.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}