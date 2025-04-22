variable "resource_group_name" {
    type = string
    description = "Name of the Resource Group name"
}

variable "location" {
    type = string
    description = "Location of the virtual network"
}

variable "subnet_id" {
  type = list(string)
  description = "This is the id of subnet"
}



