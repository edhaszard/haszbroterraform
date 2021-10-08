##########################################################
## Vnet
##########################################################
resource "azurerm_virtual_network" "vnet1" {
    name = var.vnet1_name
    location = var.location
    resource_group_name = var.location
    address_space = var.vnet1_addr_space
}