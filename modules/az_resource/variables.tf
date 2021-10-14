variable "resource_group_name" {
  description = "Name of the resource group."
}

variable "location" {
  description = "Location of the cluster."
  default     = "westeurope"
}

variable "tag_project" {
}

variable "tag_environment" {
}

variable "tag_comments" {
}