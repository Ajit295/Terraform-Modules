output "NIC_id_output" {
    value = azurerm_network_interface.example[*].id
}

output "network_interface_private_ip_address" {
    value = azurerm_network_interface.example[*].private_ip_address
}

output "nic_details" {
  value = [
    for i in range(length(var.nic_names)) : {
    name = azurerm_network_interface.example[i].name
    id = azurerm_network_interface.example[i].id
    }
  ]
}