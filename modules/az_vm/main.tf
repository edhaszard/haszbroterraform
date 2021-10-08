##########################################################
## Create NICs for VM
##########################################################
resource "azurerm_network_interface" "net_if" {
  count               = var.vm_count
  location            = var.location
  name                = "${var.vm_name}${count.index + 1}-nic"
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfmain"
    subnet_id                     = var.vm_subnet
    private_ip_address_allocation = "dynamic"
  }
  tags = {
    project     = var.tag_project
    environment = var.tag_environment
    comments    = var.tag_comments
    deployment  = var.tag_deployment
  }
}


##########################################################
## Create Windows VM
##########################################################
resource "azurerm_windows_virtual_machine" "vm" {
  name                             = "${var.vm_name}${count.index + 1}"
  count                            = var.vm_count
  location                         = var.location
  resource_group_name              = var.resource_group_name
  size                             = var.vm_size
  admin_username                   = var.vm_admin_username
  admin_password                   = var.vm_admin_password
  network_interface_ids            = [element(azurerm_network_interface.net_if.*.id, count.index)]
  # availability_set_id              = var.avset_id
  # delete_data_disks_on_termination = true
  license_type                     = "Windows_Server"

  source_image_reference {
    offer     = var.vm_storage_img_offer
    publisher = var.vm_storage_img_publisher
    sku       = var.vm_storage_img_sku
    version   = "latest"
  ### Reference to custom image
    # id = data.azurerm_image.vmimage.id
  }

  os_disk {
    name              = "${var.vm_name}${count.index + 1}-os"
    storage_account_type = var.storage_account_type
    caching           = "ReadWrite"
  }
  
  tags = {
    project     = var.tag_project
    environment = var.tag_environment
    comments    = var.tag_comments
    deployment  = var.tag_deployment
  }

}

