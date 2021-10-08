
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

resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.default_location
  tags                =  {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1_name
  address_space       = ["10.0.0.0/16"]
  location            = var.default_location
  resource_group_name = azurerm_resource_group.rg1.name
 }

 ###################################################
## VM MODULE
###################################################
module "azvm1" {
  source               = ".//modules/az_vm"
  location             = module.resourcegr.location
  resource_group_name  = module.resourcegr.resource_group_name
  vm_count             = 2
  vm_name              = "test-vm-0"
  vm_size              = "Standard_B2s"
  storage_account_type = "Standard_LRS"
  vm_subnet            = module.network1.subnet_id
  vm_admin_username    = var.vm_admin_username
  vm_admin_password    = var.vm_admin_password
  ### AZURE PUBLIC IMAGE
  vm_storage_img_publisher = "MicrosoftWindowsServer"
  vm_storage_img_offer     = "WindowsServer"
  vm_storage_img_sku       = "2019-datacenter-gensecond"
  ### TAGS
  tag_project     = module.resourcegr.tag_project
  tag_environment = module.resourcegr.tag_environment
  tag_comments    = module.resourcegr.tag_comments
  tag_deployment  = module.resourcegr.tag_deployment
}