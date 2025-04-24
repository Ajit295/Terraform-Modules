variable "resource_group_name" {
  type = string
}

variable "webapp_environment" {
  type = map(object({
    service_plan_os_type = string
    webapp_name = string
    service_plan_location = string
    service_plan_sku_name = string

  }))
}