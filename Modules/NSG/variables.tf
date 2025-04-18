variable "nsg_name" {
    type = string
    description = "Name of the Network security group"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group name"
}

variable "location" {
    type = string
    description = "Name of the location"
}

# variable "security_rule_name" {
#     type = string
#     description = "Name of the security rule name"
# }

variable "Allow_security_rules" {
  type = map(object({
    priority = number
    destination_port_range = number
  })) 
}
variable "subnet_id" {
    type = list(string)
    description = "subnet id to link with NSG"
}

variable "no_of_virtual_machines" {
    type = number
    description = "No of virtual machines that we want to create"
    default = 1
}

