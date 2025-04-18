resource "azurerm_network_interface" "example" {
  count = var.no_of_virtual_machines
  name                = "${var.nic_name}-${count.index+1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id[count.index]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.public_ip_address_id[count.index]
  }
}