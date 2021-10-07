output "vm_ids" {
  value = azurerm_windows_virtual_machine.vm[0].id
}

output "network_interface_id" {
  value = azurerm_network_interface.net_if[0].id
}

