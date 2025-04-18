resource "azurerm_public_ip" "public_ip" {
  count = var.no_of_virtual_machines
  name                = "${var.pip_name}-${count.index+1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

}
