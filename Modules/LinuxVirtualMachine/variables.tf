variable "vm_name" {
    type = string
    description = "Name of the server"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group name"
}

variable "location" {
    type = string
    description = "Name of the location"
}

variable "NIC_id" {
    type = list(string)
    description = "network inteface id"
}

variable "no_of_virtual_machines" {
    type = number
    description = "No of virtual machines that we want to create"
    default = 1
}