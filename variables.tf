variable "no_of_virtual_machines" {
  type        = number
  description = "No of virtual machines that we want to create"
  default     = 1
}

variable "subnet_names" {
  type        = list(string)
  description = "this is name of subnets"
}

variable "storage_account_details" {
  type = map(string)
}

variable "container_names" {
  type = list(string)
}

variable "blobs" {
  type = map(object({
    container_name = string
    blob_location  = string
  }))
}

# variable "dbapp_environment" {
#   type = map(object({
#     server = map(object({
#       sku    = string
#       dbname = string
#     }))

#   }))
# }

# variable "webapp_environment" {
#   type = map(object({
#     serviceplan = map(object({
#       sku     = string
#       os_type = string
#     }))

#     serviceapp = map(string)
#   }))
# }


variable "Allow_security_rules" {
  type = map(object({
    priority               = number
    destination_port_range = number
  }))
}

# variable "webapp_environment" {
#   type = map(object({
#     service_plan_os_type  = string
#     webapp_name           = string
#     service_plan_location = string
#     service_plan_sku_name = string

#   }))
# }

# variable "traffic_manager_endpoints" {
#   type = map(object({
#     weight   = number
#     priority = number
#   }))
# }