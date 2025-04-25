
# using for loop with subnet name as iterator to get the subnet id of that perticular subnet in correct order
output "subnet_id" {
    value = [for subnet_name in var.subnet_names : azurerm_subnet.subnet[subnet_name].id]
}