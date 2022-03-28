
#################################################
## TERRAFORM CLOUD DETAILS (Only used for remote apply with Terraform Cloud)
#################################################
terraform {
  backend "remote" {
    organization = "haszbro2"
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

###################################################
## RESOURCE GROUP MODULE(S)
###################################################
module "resourcegr1" {
  source              = ".//modules/az_resource" ### Logical path to module files
  location            = var.default_location
  resource_group_name = var.resource_group_name
  ### TAGS - Referenced by other modules below
  tag_project     = "haszbro testing"
  tag_environment = "TEST/DEV"
  tag_comments    = "VMs for Ed testing Terraform"
}

module "resourcegr2" {
  source              = ".//modules/az_resource" ### Logical path to module files
  location            = var.default_location
  resource_group_name = var.resource_group2_name
  ### TAGS - Referenced by other modules below
  tag_project     = "haszbro testing"
  tag_environment = "TEST/DEV"
  tag_comments    = "VMs for Ed testing Terraform 2"
}

###################################################
## NETWORK MODULE(S)
###################################################
module "network1" {
  source = ".//modules/az_network"
  location = module.resourcegr2.location
  network_resource_group_name = module.resourcegr2.rg_name
  vnet_name = var.vnet1_name
  vnet_addr_space = var.vnet1_addr_space
  subnet1_name = var.vnet1_subnet1_name
  subnet1_prefix  = var.vnet1_subnet1_prefix
  subnet2_name = var.vnet1_subnet2_name
  subnet2_prefix  = var.vnet1_subnet2_prefix
}

module "network2" {
  source = ".//modules/az_network"
  location = module.resourcegr1.location
  network_resource_group_name = module.resourcegr1.rg_name
  vnet_name = var.vnet2_name
  vnet_addr_space = var.vnet2_addr_space
  subnet1_name = var.vnet2_subnet1_name
  subnet1_prefix  = var.vnet2_subnet1_prefix
  subnet2_name = var.vnet2_subnet2_name
  subnet2_prefix  = var.vnet2_subnet2_prefix
}
