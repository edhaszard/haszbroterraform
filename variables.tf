variable "resource_group_name" {
  default = "mytestTFResourceGroup"
}

variable "default_location" {
    default = "australiaeast"  
}

#### The following variables are set in the Terraform Cloud workspace but need to be defined here

variable "vm_admin_username"{
  description = "VM local admin username"
  default = ""
}

variable "vm_admin_password"{
  description = "VM local admin password"
  default = ""
}