resource "azurerm_resource_group" "apprg" {
  name     = "${var.base_name}-RG"
  location = var.location
}

