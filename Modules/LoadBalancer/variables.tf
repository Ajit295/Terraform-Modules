variable "resource_group_name" {
    type = string
    description = "This is the resource group name of NIC"
}

variable "location" {
    type = string
    description = "Location of the NIC"
}

variable "no_of_virtual_machines" {
    type = number
    description = "No of virtual machines that we want to create"
    default = 1
}

variable "virtual_network_id" {
    type = string
    description = "This is id of virtula network" 
}

variable "network_interface_private_ip_address" {
  type = list(string)
  description = "This is the private ip addresses of network interfaces"
}