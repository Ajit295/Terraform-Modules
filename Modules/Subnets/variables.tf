variable "base_name" {
    type = string
    description = "Name of the subnet"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group name where subnets are resides"
}

variable "virtual_network_name" {
    type = string
    description = "name of the virtual network"
}

variable "no_of_virtual_machines" {
    type = number
    description = "No of virtual machines that we want to create"
    default = 1
}