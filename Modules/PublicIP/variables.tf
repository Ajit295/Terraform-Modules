variable "pip_name" {
    type = string
    description = "name of the public IP"
}

variable "resource_group_name" {
    type = string
    description = "This is the resource group name of PIP"
}

variable "location" {
    type = string
    description = "Location of the PIP"
}

variable "no_of_virtual_machines" {
    type = number
    description = "No of virtual machines that we want to create"
    default = 1
}
