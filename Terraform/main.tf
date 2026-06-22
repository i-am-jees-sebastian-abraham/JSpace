terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

variable "subscription_id" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-gha-demo"
  location = "Central US"
}

resource "azurerm_storage_account" "stg" {
  name                     = "ghastorage${random_string.rand.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "random_string" "rand" {
  length  = 6
  special = false
  upper   = false
}
