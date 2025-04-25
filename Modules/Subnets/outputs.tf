output "subnet_id" {
    value = values(azurerm_subnet.subnet)[*].id
}