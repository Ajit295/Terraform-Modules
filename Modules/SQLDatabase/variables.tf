variable "resource_group_name" {
    type = string
    description = "Name of the resource group name where subnets are resides"
}

variable "location" {
    type = string
    description = "The location where resources will resides"
}

variable "dbapp_environment" {
  type = map(object({
    server = map(object({
        sku      = string
        dbname = string
      }))

    }))
  }

 variable "start_ip_address" {
  type = string
  description = "This the starting/starting ip address range which is allowed to access the database"
 }

 variable "end_ip_address" {
  type = string
  description = "This is end/end ip address range which is allowed to access the database"
 }


