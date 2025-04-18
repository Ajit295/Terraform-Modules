resource "azurerm_subnet" "subnet" {
  # Create multiple subnet using count argument
  count = var.no_of_virtual_machines
  name                 = "${var.base_name}${count.index+1}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.${count.index}.0/24"]

}