variable "resource_group_name" {
    type = string
    description = "Name of the resource group name where subnets are resides"
}

variable "location" {
    type = string
    description = "The location where resources will resides"
}

variable "webapp_environment" {
  type = map(object({
    serviceplan = map(object({
      sku     = string
      os_type = string
    }))

    serviceapp = map(string)
  }))
}