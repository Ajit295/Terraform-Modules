variable "resource_group_name" {
    type = string
    description = "Name of the resource group name"
}

variable "location" {
    type = string
    description = "Name of the location"
}

variable "gateway_subnet_details" {
    type = list(string)
    description = "Details of subnet details"
}