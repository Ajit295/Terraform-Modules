output "public_ip_address_id_output" {
    value = azurerm_public_ip.public_ip[*].id
}