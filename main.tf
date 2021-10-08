
#################################################
## TERRAFORM CLOUD DETAILS (Only used for remote apply with Terraform Cloud)
#################################################
terraform {
  backend "remote" {
    organization = "haszbro"
    workspaces {
      name = "haszbroterraform"
    }
  }
    required_providers {
    azurerm = "2.50"
  }
}

provider "azurerm" {
  subscription_id = "b23bbcd9-8ee7-4fcf-944d-c4589f4365de"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "mytestTFResourceGroup"
  location = "australiaeast"
  tags                =  {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "myTestTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "australiaeast"
  resource_group_name = azurerm_resource_group.rg.name
 }
}