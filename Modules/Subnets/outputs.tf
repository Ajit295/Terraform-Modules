output "subnet_id" {
    value = [for subnet_name in var.subnet_names : azurerm_subnet.subnet[subnet_name].id]
}