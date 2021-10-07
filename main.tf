
#################################################
## TERRAFORM CLOUD DETAILS (Only used for remote apply with Terraform Cloud)
#################################################
terraform {
  backend "remote" {
    organization = "haszbro"
    workspaces {
      name = "Azure-rg-ihc-prd-raid-01_PROD"
    }
  }
    required_providers {
    azurerm = "2.50"
  }
}

###################################################
## Provider details
###################################################
provider "azurerm" {
  subscription_id = "b23bbcd9-8ee7-4fcf-944d-c4589f4365de"
  features {}
}

###################################################
## RESOURCE GROUP MODULE
###################################################
module "resourcegr" {
  source                      = ".//modules/az_resource" ### Logical path to module files
  location                    = "australiaeast"
  resource_group_name         = "rg-ih-prd-raid-01"
  ### TAGS - Referenced by other modules below
  tag_project                 = "RADIUS"
  tag_environment             = "Production"
  tag_comments                = "Azure RADIUS servers"
  tag_deployment              = "Code version: 1.1, Terraform version: 0.15.0"
  }

###################################################
## NETWORK MODULE
###################################################
module "network" {
  source              = ".//modules/az_network"
  location            = module.resourcegr.location
  network_resource_group_name = "ExpressRouteRG"
  vnet_name           = "vnet-orb-ae-prod-01"
  ### SUBNETS
  subnet1_name        = "subnet-prd-adds-01"
  
  
}
  
###################################################
## WINDOWS VM MODULE
###################################################
module "azvm1" {
  source               = ".//modules/az_windows_vm"
  location             = module.resourcegr.location
  resource_group_name  = module.resourcegr.resource_group_name
  vm_count             = 2
  vm_name              = "prd-raid-0"
  vm_size              = "Standard_D2s_v3"
  storage_account_type = "StandardSSD_LRS"
  data_disk_size       = "100"
  data_disk_type       = "StandardSSD_LRS"
  vm_subnet            = module.network.subnet1_id
  avset_id             = module.azavset.avset_id
  ip_address_range    = "10.200.0."
  vm_admin_username    = var.vm_admin_username
  vm_admin_password    = var.vm_admin_password
  ad_join_password     = var.ad_join_password
  workspace_key        = var.workspace_key
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
