##########################################################
## Vnet
##########################################################
resource "azurerm_virtual_network" "vnet1" {
    name = var.vnet_name
    location = var.location
    resource_group_name = var.network_resource_group_name
    address_space = var.vnet_addr_space
}

##########################################################
## Subnet
##########################################################
resource "azurerm_subnet" "subnet1" {
    name = var.subnet1_name
    virtual_network_name = azurerm_virtual_network.vnet1.name
    resource_group_name = var.network_resource_group_name
    address_prefixes = var.subnet1_prefix
}