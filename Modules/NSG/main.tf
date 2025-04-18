resource "azurerm_network_security_group" "NSG" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "NSG_rules" {
  for_each = var.Allow_security_rules
  name                        = each.key
  priority                    = each.value.priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.NSG.name
  depends_on = [ azurerm_network_security_group.NSG ]
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_linking" {
  count = var.no_of_virtual_machines
  subnet_id                 = var.subnet_id[count.index]
  network_security_group_id = azurerm_network_security_group.NSG.id
  depends_on = [ azurerm_network_security_group.NSG ]
}