# Using for each loop to iterate over subnet names to create subnet.

resource "azurerm_subnet" "subnet" {
  for_each = toset(var.subnet_names)
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.${index(var.subnet_names, each.key)}.0/24"]

}