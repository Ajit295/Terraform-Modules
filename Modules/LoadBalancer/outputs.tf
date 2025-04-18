output "ip_address" {
  value = azurerm_lb_backend_address_pool_address.backend_pool_address[*].ip_address
}
