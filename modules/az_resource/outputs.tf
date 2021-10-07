output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "tag_project" {
  value = var.tag_project
}
output "tag_environment" {
  value = var.tag_environment
}
output "tag_comments" {
  value = var.tag_comments
}
output "tag_deployment" {
  value = var.tag_deployment
}

