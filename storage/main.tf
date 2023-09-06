terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

resource "azurerm_resource_group" "terraform_state" {
  name     = "terraform_state"
  location = "southeast asia"
}

resource "azurerm_storage_account" "terraform_state" {
  name                     = "vinex22terraformstate"
  resource_group_name      = azurerm_resource_group.terraform_state.name
  location                 = azurerm_resource_group.terraform_state.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_container" "terraform_state" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}
