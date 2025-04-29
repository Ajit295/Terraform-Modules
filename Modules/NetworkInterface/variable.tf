variable "resource_group_name" {
    type = string
    description = "This is the resource group name of NIC"
}

variable "location" {
    type = string
    description = "Location of the NIC"
}

variable "nic_names" {
    type = list(string)
    description = "This is the name of the network interface card"
}

variable "subnet_id" {
    type = list(string)
    description = "Subnet ID of the subnet in which this NIC will run"
}

variable "public_ip_address_id" {
    type = list(string)
    description = "id of the Public ID of the subnet which need to associate with this NIC"
}

variable "no_of_virtual_machines" {
    type = number
    description = "No of virtual machines that we want to create"
    default = 1
}
