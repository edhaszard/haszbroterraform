# RG variables

variable "resource_group_name" {
  default = "mytestTFResourceGroup1"
}

variable "resource_group2_name" {
  default = "mytestTFResourceGroup2"
}

variable "default_location" {
    default = "australiaeast"  
}

# vnet variables

variable "vnet1_name" {
  default = "1sttestVnet"
}

variable "vnet1_addr_space" {
  default = ["10.0.0.0/16"]
}

variable "vnet2_name" {
  default = "2ndtestVnet"
}

variable "vnet2_addr_space" {
  default = ["10.1.0.0/16"]
}

# subnet variebles

variable "vnet1_subnet1_name" {
  default = "testsubnet1"
}

variable "vnet1_subnet1_prefix" {
  default = ["10.0.0.0/24"]
}

variable "vnet1_subnet2_name" {
  default = "testsubnet2"
}

variable "vnet1_subnet2_prefix" {
  default = ["10.0.1.0/24"]
}

variable "vnet2_subnet1_name" {
  default = "vnet2sub1"
}

variable "vnet2_subnet1_prefix" {
  default = ["10.1.0.0/24"]
}

variable "vnet2_subnet2_name" {
  default = "vnet2sub2"
}

variable "vnet2_subnet2_prefix" {
  default = ["10.0.1.0/24"]
}

# The following variables are set in the Terraform Cloud workspace but need to be defined here

variable "vm_admin_username"{
  description = "VM local admin username"
  default = ""
}

variable "vm_admin_password"{
  description = "VM local admin password"
  default = ""
}