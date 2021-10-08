##########################################################
## Create Resource Group
##########################################################
resource "azurerm_resource_group" "rg1" {
  name        = var.resource_group_name
  location    = var.location

  tags = {
    project     = var.tag_project
    environment = var.tag_environment
    comments    = var.tag_comments
    deployment  = var.tag_deployment
  }
}