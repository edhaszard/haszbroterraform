##########################################################
## Get data for existing Resource Group
##########################################################
data "azurerm_resource_group" "rg" {
  name     = var.network_resource_group_name
}

##########################################################
## Get data for existing Vnet
##########################################################
data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name

}

##########################################################
## Get existing subnets
##########################################################

data "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}
