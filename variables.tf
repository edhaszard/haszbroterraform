variable "resource_group_name" {
  default = "mytestTFResourceGroup"
}

variable "resource_group2_name" {
  default = "mytestTFResourceGroup2"
}

variable "default_location" {
    default = "australiaeast"  
}

variable "vnet1_name" {
  default = "1sttestVnet"
}

variable "vnet1_addr_space" {
  default = ["10.0.0.0/16"]
}

variable "vnet1_subnet1_name" {
  default = "testsubnet1"
}

variable "vnet1_subnet1_prefix" {
  default = ["10.0.0.0/24"]
}

#variable "network_resource_group_name" {
#  default = "mytestTFResourceGroup2"
#}

#### The following variables are set in the Terraform Cloud workspace but need to be defined here

variable "vm_admin_username"{
  description = "VM local admin username"
  default = ""
}

variable "vm_admin_password"{
  description = "VM local admin password"
  default = ""
}