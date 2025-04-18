variable "no_of_virtual_machines" {
  type        = number
  description = "No of virtual machines that we want to create"
  default     = 1
}

variable "dbapp_environment" {
  type = map(object({
    server = map(object({
      sku    = string
      dbname = string
    }))

  }))
}

variable "webapp_environment" {
  type = map(object({
    serviceplan = map(object({
      sku     = string
      os_type = string
    }))

    serviceapp = map(string)
  }))
}


variable "Allow_security_rules" {
  type = map(object({
    priority               = number
    destination_port_range = number
  }))
}