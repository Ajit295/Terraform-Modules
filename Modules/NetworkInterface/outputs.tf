output "NIC_id_output" {
    value = azurerm_network_interface.example[*].id
}

output "network_interface_private_ip_address" {
    value = azurerm_network_interface.example[*].private_ip_address
}

output "nic_details" {
  value = [
    for nic_name in var.var.nic_names : {
    name = azurerm_network_interface.example[nic_name].name
    ip = azurerm_network_interface.example[nic_name].id
    }
  ]
}