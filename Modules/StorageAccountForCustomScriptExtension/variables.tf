variable "resource_group_name" {
    type = string
    description = "Name of the resource group name"
}

variable "location" {
    type = string
    description = "Name of the location"
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
    blob_location = string
  }))
}
