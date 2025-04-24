variable "resource_group_name" {
  type = string
}

variable "traffic_manager_endpoints" {
  type = map(object({
    weight = number
    priority = number
  }))
}

variable "webapp_ids" {
  type = list(string)
}

variable "webapp_hostname" {
  type = list(string)
}