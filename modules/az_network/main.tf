##########################################################
## Vnet
##########################################################
resource "azurerm_virtual_network" "vnet1" {
    name = var.vnet_name
    location = var.location
    network_resource_group_name = var.network_resource_group_name
    address_space = var.vnet_addr_space
}