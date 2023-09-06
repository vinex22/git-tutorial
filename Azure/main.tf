
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.location
  
  lifecycle {
    create_before_destroy = true
  }
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = var.net_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
  depends_on          = [azurerm_resource_group.example]
  lifecycle {
    create_before_destroy = true
    
  }
}


